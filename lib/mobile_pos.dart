import 'package:flutter/material.dart';

import 'mobile_pos_platform_interface.dart';
import 'src/helpers/enums.dart';

class MobilePos {
 static  Future<void> startRavenPay(BuildContext context) async {
    return await MobilePosPlatform.instance.startRavenPay(context);
  }

 static  Future<void> closeRavenPay(BuildContext context) async {
    return await MobilePosPlatform.instance.closeRavenPay(context);
  }

 static  Future<bool?> checkConnectivity(ConnectivityType connectivityType) async {
    return await MobilePosPlatform.instance.checkConnectivity(connectivityType);
  }

 static  Future<String?> startTransaction(
      {required int amount, required String accountType}) async {
    var sendMap = <String, dynamic>{
      'amount': amount,
      'account_type': accountType
    };

    return await MobilePosPlatform.instance
        .startTransaction(amount: amount, accountType: accountType);
  }
}
