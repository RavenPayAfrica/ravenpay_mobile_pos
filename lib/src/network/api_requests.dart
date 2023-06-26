import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mobile_pos/mobile_pos_sdk.dart';
import 'package:mobile_pos/src/helpers/global_variables.dart';
import 'package:mobile_pos/src/helpers/helper_functions.dart';
import 'package:mobile_pos/src/helpers/logger.dart';
import 'package:mobile_pos/src/models/success_response.dart';
import 'package:mobile_pos/src/network/http_base.dart';
import 'package:mobile_pos/src/shared_widgets/progress_dialog.dart';
import 'package:mobile_pos/src/views/card_payment/card_success_page.dart';

import '../models/card_tx_response.dart';

class ApiRequest {
  static Future<RavenMPOSResponse> processCard(
      BuildContext context, double amount, String cardData) async {
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

    final serializedMap = nibssMap.map((key, value) {
      if (nibssMap[key] == null) {
        return MapEntry(key, '');
      } else {
        return MapEntry(key, value);
      }
    });

    logData(jsonEncode(nibssMap));

    var response = await HttpBase.postRequest(serializedMap, 'card/processing');
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
      throw RavenMobilePOSException(
          code: kUpdateUserError,
          message: 'User account update failed: ${response['message']}');
    } else {
      return response['status'] == 'success';
    }
  }

  static Future<bool> requestTerminal({
    required int qty,
    required String state,
    required String lga,
    required String address,
    required String landmark,
  }) async {
    final payload = {
      "quantity": qty,
      "delivery_state": state,
      "delivery_address": address,
      "delivery_lga": lga,
      "landmark": landmark,
    };
    payload["poseidon_email"] = pluginConfig.customerInfo.email;
    payload["affiliate_app_id"] = pluginConfig.appInfo.appId;
    var response = await HttpBase.postRequest(payload, 'pdon/request_bankbox');
    logData(response);

    //failed
    if (response == 'failed' || response == null) {
      throw RavenMobilePOSException(
          code: kRequestTerminalError,
          message: 'Terminal request failed: ${response['message']}');
    } else {
      return response['status'] == 'success';
    }
  }

  static Future<List> getUserTerminals({
    required int qty,
    required String state,
    required String lga,
    required String address,
    required String landmark,
  }) async {
    final payload = {
      "quantity": qty,
      "delivery_state": state,
      "delivery_address": address,
      "delivery_lga": lga,
      "landmark": landmark,
    };
    payload["poseidon_email"] = pluginConfig.customerInfo.email;
    payload["affiliate_app_id"] = pluginConfig.appInfo.appId;
    var response = await HttpBase.postRequest(payload, 'pdon/request_bankbox');
    logData(response);

    //failed
    if (response == 'failed' || response == null) {
      throw RavenMobilePOSException(
          code: kRequestTerminalError,
          message: 'Terminal request failed: ${response['message']}');
    } else {
      return [];
    }
  }
}
