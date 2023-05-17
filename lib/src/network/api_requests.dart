import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mobile_pos/mobile_pos_sdk.dart';
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
}
