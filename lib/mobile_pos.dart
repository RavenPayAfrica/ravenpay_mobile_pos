import 'package:flutter/material.dart';

import 'mobile_pos_platform_interface.dart';

class MobilePos {
  Future<String?> getPlatformVersion() {
    return MobilePosPlatform.instance.getPlatformVersion();
  }

  Future<void> startRavenPay(BuildContext context) async {
    return await MobilePosPlatform.instance.startRavenPay(context);
  }

  Future<void> closeRavenPay(BuildContext context) async {
    return await MobilePosPlatform.instance.closeRavenPay(context);
  }
}
