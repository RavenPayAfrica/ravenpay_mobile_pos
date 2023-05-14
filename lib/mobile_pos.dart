import 'package:flutter/material.dart';

import 'mobile_pos_platform_interface.dart';
import 'src/helpers/enums.dart';

class MobilePos {
  static Future<void> startRavenPay(BuildContext context) async {
    return await MobilePosPlatform.instance.startRavenPay(context);
  }

  static Future<void> closeRavenPay(BuildContext context) async {
    return await MobilePosPlatform.instance.closeRavenPay(context);
  }

  static Future<bool?> checkConnectivityStatus(
      ConnectivityType connectivityType) async {
    return await MobilePosPlatform.instance
        .checkConnectivityStatus(connectivityType);
  }

  static Future<String?> startTransaction(
      {required double amount,
      required ConnectivityType connectivityType}) async {
    return await MobilePosPlatform.instance
        .chargeCard(amount: amount, connectivityType: connectivityType);
  }
}
