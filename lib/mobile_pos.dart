import 'package:flutter/material.dart';
import 'package:mobile_pos/src/models/config.dart';
import 'mobile_pos_platform_interface.dart';

class RavenMobilePOS {
  static Future<void> launch(BuildContext context,
      {required RavenMobilePOSConfig config}) async {
    MobilePosPlatform.instance.setConfig(config);
    return await MobilePosPlatform.instance.startRavenPay(context);
  }

  static Future<void> close(BuildContext context) async {
    return await MobilePosPlatform.instance.closeRavenPay(context);
  }
}
