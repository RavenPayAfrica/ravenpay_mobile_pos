import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mobile_pos/mobile_pos_sdk.dart';
import 'package:mobile_pos/src/helpers/global_variables.dart';
import 'package:mobile_pos/src/helpers/helper_functions.dart';
import 'package:mobile_pos/src/helpers/logger.dart';
import 'package:mobile_pos/src/models/app_info_model.dart';
import 'package:mobile_pos/src/models/keydetails.dart';
import 'package:mobile_pos/src/models/success_response.dart';
import 'package:mobile_pos/src/models/terminal_model.dart';
import 'package:mobile_pos/src/network/http_base.dart';
import 'package:mobile_pos/src/shared_widgets/progress_dialog.dart';
import 'package:mobile_pos/src/views/card_payment/card_success_page.dart';

import '../models/card_tx_response.dart';

class ApiRequests {
  static Future<RavenMPOSResponse> processCard(BuildContext context, double amount, String cardData) async {
    final body = json.decode(cardData);
    final cardModel = CardTransactionResponseModel.fromJson(body);

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => const ProgressDialog(
              status: 'Processing...',
            ));

    Map<String, dynamic> nibssMap = cardModel.nibbsEMV!.toJson();
    nibssMap.update('ssl', (value) => 'true');

    final payload = <String, dynamic>{};

    final serializedMap = nibssMap.map((key, value) {
      if (nibssMap[key] == null) {
        return MapEntry(key, '');
      } else {
        return MapEntry(key, value);
      }
    });

    payload['card_data'] = serializedMap;
    payload['poseidon_serial_number'] = '2303280101';
    payload['app_profile'] = {
      "affiliate_app_name": pluginConfig.appInfo.appName,
      "affiliate_app_id": pluginConfig.appInfo.appId,
      "poseidon_business_email": pluginConfig.customerInfo.email,
      "bvn": pluginConfig.customerInfo.bvn
    };


    logData(jsonEncode(payload));

    var response = await HttpBase.postRequestJson(payload, 'pdon/card_processing');

    logData("Card processed");

    logData(response.toString());

    Navigator.pop(context);

    //failed
    if (response == 'failed' || response == null) {
      throw RavenMobilePOSException(
          code: kNibbsError, message: 'Transaction failed to complete');
    } else {
      logData(response);
      //Completes with a response
      if (response['data']['data']['resp'].toString() == '00') {
        final res = RavenMPOSResponse(data: Map.from(response));
        //success
        pushRoute(
            context,
            CardSuccessPage(
              amount: amount,
              response: res,
            ));
        return res;
      } else {
        //Unsuccessful
        throw RavenMobilePOSException(
            code: kNibbsError, message: 'Transaction failed to complete');
      }
    }
  }

  static Future<void> fetchAppInfo() async {

    if (aflliateInfo != null) return;

    final payload = {"affiliate_app_id": pluginConfig.appInfo.appId};

    var response = await HttpBase.postRequest(payload, 'pdon/affiliate_app_setting');

    if (response != null && response != 'failed') {

      if (response['data'] != null) {

        aflliateInfo = AflliateInfoModel.fromJson(response['data']['appsetting']);

        keyDetails = KeyDetails.fromJson(response['data']['keydetails']);

        if(keyDetails != null){
          logData('Keys Acquired');
        }

      }

    }

    logData(response);

  }

  static Future<void> registerUser() async {
    final payload = pluginConfig.customerInfo.toJson();
    payload["affiliate_app_id"] = pluginConfig.appInfo.appId;
    var response = await HttpBase.postRequest(payload, 'pdon/register');
    logData(response);
  }

  static Future<bool> updateUserDetails({
    required String busnessName,
    required String businessAddress,
    required String businessDescription,
    String? nin,
  }) async {
    final payload = {
      "busines_name": busnessName,
      "business_address": businessAddress,
      "business_description": businessDescription,
      "nin": nin ?? ''
    };
    payload["email"] = pluginConfig.customerInfo.email;
    payload["business_type"] = "poseidon";

    payload["affiliate_app_id"] = pluginConfig.appInfo.appId;
    var response = await HttpBase.postRequest(payload, 'pdon/update');
    logData(response);

    //failed
    if (response == 'failed' || response == null) {
      final error = RavenMobilePOSException(
          code: kUpdateUserError,
          message: 'User account update failed: ${response['message']}');
      pluginConfig.onError(error);
      return false;
    } else {
      return response['status'] == 'success';
    }
  }

  static Future<bool> requestTerminal({
    required int qty,
    String? state,
    String? lga,
    String? address,
    String? landmark,
    required DeliveryMethod deliveryMethod,
  }) async {
    final payload = {
      "quantity": qty.toString(),
      "delivery_state": state ?? 'pickup',
      "delivery_address": address ?? 'pickup',
      "delivery_lga": lga ?? 'pickup',
      "landmark": landmark ?? 'pickup',
      "delivery_option": deliveryMethod.name
    };
    payload["poseidon_email"] = pluginConfig.customerInfo.email;
    payload["affiliate_app_id"] = pluginConfig.appInfo.appId;
    var response = await HttpBase.postRequest(payload, 'pdon/request_bankbox');
    logData(response);

    //failed
    if (response == 'failed' || response == null) {
      final error = RavenMobilePOSException(
          code: kRequestTerminalError, message: 'Terminal request failed');

      pluginConfig.onError(error);
      return false;
    } else {
      return response['status'] == 'success';
    }
  }

  static Future<List<TerminalRequestModel>> getUserTerminalRequests() async {
    final payload = {
      "poseidon_email": pluginConfig.customerInfo.email,
      "affiliate_app_id": pluginConfig.appInfo.appId,
    };

    var response = await HttpBase.postRequest(payload, 'pdon/bankbox_request');
    logData(response);

    //failed
    if (response == 'failed' || response == null) {
      final error = RavenMobilePOSException(
          code: kRequestTerminalError,
          message: 'Get user terminals request failed');
      pluginConfig.onError(error);
      return [];
    } else {
      final list = (response['data'] as List)
          .map((e) => TerminalRequestModel.fromJson(e))
          .toList();
      return list;
    }
  }

  static Future<List<TerminalModel>> getUserTerminals() async {
    final payload = {
      "poseidon_email": pluginConfig.customerInfo.email,
      "affiliate_app_id": pluginConfig.appInfo.appId,
    };

    var response = await HttpBase.postRequest(payload, 'pdon/user_bankbox');
    logData(response);

    //failed
    if (response == 'failed' || response == null) {
      final error = RavenMobilePOSException(
          code: kRequestTerminalError, message: 'Get user terminals failed');
      pluginConfig.onError(error);
      return [];
    } else {
      final list = (response['data'] as List)
          .map((e) => TerminalModel.fromJson(e))
          .toList();
      return list;
    }
  }

  static Future<void> getPdonKeyDetails() async {

    final map = {
      'serial': '98211206905806',
    };

    var response = await HttpBase.postRequest(map, 'pdon/get_keys');
    logData(response);

    if(response == null || response == 'failed'){
      return;
    }

    keyDetails = KeyDetails.fromJson(response['data']);
    if(keyDetails != null){
      logData('Keys Acquired');
    }

  }


}
