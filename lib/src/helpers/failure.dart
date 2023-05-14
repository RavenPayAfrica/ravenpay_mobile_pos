class RavenMobilePOSException implements Exception {
  String code;
  String message;

  RavenMobilePOSException({required this.code, required this.message});
}
