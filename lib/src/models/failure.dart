const String kCardReadError = 'card-read-error';
const String kNibbsError = 'nibbs-error';
const String kUpdateUserError = 'update-user-error';
const String kRequestTerminalError = 'terminal-request-error';
const String kAffliateUpdateError = 'missing-biz-info-error';
const String kDeviceLabelUpdateError = 'missing-biz-info-error';

const String kBluetoothPermissionError = 'bluetooth-permission-error';

class RavenMobilePOSException implements Exception {
  String code;
  String message;

  RavenMobilePOSException({required this.code, required this.message});
  @override
  String toString() {
    return "Code: $code\nMessage: $message";
  }
}
