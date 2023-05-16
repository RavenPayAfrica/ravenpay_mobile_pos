import 'package:mobile_pos/mobile_pos_sdk.dart';
import 'package:mobile_pos/src/models/business_info.dart';

class RavenMobilePOSConfig {
  ///Called when a transaction completes successfully
  final Function(dynamic) onSuccess;

  ///Called when a transaction fails
  final Function(RavenMobilePOSException exception) onError;

  ///Defaults to [RavenMobilePOSEnviroment.staging],
  final RavenMobilePOSEnviroment enviroment;

  ///Customise the look and feel of the plugin
  MobilePOSTheme? theme;

  BusinessInfo businessInfo;

  RavenMobilePOSConfig(
      {required this.onSuccess,
      required this.onError,
      required this.businessInfo,
      this.theme,
      this.enviroment = RavenMobilePOSEnviroment.staging})
      : super() {
    theme = theme ?? MobilePOSTheme.defaults();
  }

  bool get isStaging => enviroment == RavenMobilePOSEnviroment.staging;
}
