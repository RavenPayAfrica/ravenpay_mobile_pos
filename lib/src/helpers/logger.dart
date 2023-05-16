import 'dart:developer';

import 'package:mobile_pos/mobile_pos_platform_interface.dart';

void logData(String data) {
  if (MobilePosPlatform.instance.config!.isStaging) {}
  log(data);
}
