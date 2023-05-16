import 'dart:developer';

import 'package:mobile_pos/src/helpers/global_variables.dart';

void logData(dynamic data) {
  if (pluginConfig.isStaging) {}
  log(data.toString());
}
