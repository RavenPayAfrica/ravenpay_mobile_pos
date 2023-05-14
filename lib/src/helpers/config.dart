import 'package:mobile_pos/mobile_pos_sdk.dart';
import 'package:mobile_pos/src/helpers/failure.dart';

class RavenMobilePOSConfig {
  final Function(dynamic) onSuccess;
  final Function(RavenMobilePOSException exception) onError;
  final RavenMobilePOSEnviroment enviroment;

  RavenMobilePOSConfig(
      {required this.onSuccess,
      required this.onError,
      this.enviroment = RavenMobilePOSEnviroment.staging});
}
