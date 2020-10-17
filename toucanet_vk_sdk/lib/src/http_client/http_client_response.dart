part of 'http_client.dart';

class HttpClientResponse implements TransportClientResponse {
  @override
  final int code;

  @override
  final String body;

  @override
  final Map<String, String> headers;

  HttpClientResponse(this.code, this.body, [this.headers = const {}]);
}
