import 'package:mobile_pos/mobile_pos_sdk.dart';

class RavenMobilePOSConfig {
  ///Called when a transaction completes successfully
  final Function(dynamic) onSuccess;

  ///Called when a transaction fails
  final Function(RavenMobilePOSException exception) onError;

  ///Defaults to [RavenMobilePOSEnviroment.staging],
  final RavenMobilePOSEnviroment enviroment;

  ///Customise the look and feel of the plugin
  MobilePOSTheme? theme;

  ///Contains details about this app instance
  AppInfo appInfo;

  ///Set to true if you wish to show the label at the bottom
  bool showLabel;

  ///Infomation about current user
  CustomerInfo customerInfo;

  RavenMobilePOSConfig(
      {required this.onSuccess,
      required this.onError,
      required this.appInfo,
      this.showLabel = true,
      this.theme,
      required this.customerInfo,
      this.enviroment = RavenMobilePOSEnviroment.staging})
      : super() {
    theme = theme ?? MobilePOSTheme.defaults();
  }

  bool get isStaging => enviroment == RavenMobilePOSEnviroment.staging;
}
