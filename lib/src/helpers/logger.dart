import 'dart:developer';

import 'package:mobile_pos/src/helpers/global_variables.dart';

void logData(dynamic data, {String name = ''}) {
  if (pluginConfig.isStaging) {}
  log(data.toString(), name: name);
}
