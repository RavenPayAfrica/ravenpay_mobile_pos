const String kCardReadError = 'card-read-error';
const String kNibbsError = 'n-error';

class RavenMobilePOSException implements Exception {
  String code;
  String message;

  RavenMobilePOSException({required this.code, required this.message});
  @override
  String toString() {
    return "Code: $code\nMessage: $message";
  }
}
