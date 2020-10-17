class TransportClientException implements Exception {
  final String? message;

  TransportClientException(this.message);
}

abstract class TransportClientResponse {
  int get code;
  String get body;
  Map<String, String> get headers;
}

abstract class TransportClient {
  Future<TransportClientResponse> get(
    String url, [
    Map<String, String> parameters = const {},
  ]);

  Future<TransportClientResponse> post(
    String url, [
    Map<String, String> body = const {},
  ]);
}
