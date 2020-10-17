import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as _http;

import '../base/transport_client.dart';

part 'http_client_response.dart';

class HttpClient implements TransportClient {
  @override
  Future<TransportClientResponse> get(
    String url, [
    Map<String, String> parameters = const {},
  ]) =>
      _fetch(url, body: null);

  @override
  Future<TransportClientResponse> post(
    String url, [
    Map<String, String> body = const {},
  ]) =>
      _fetch(url, body: body);

  Future<HttpClientResponse> _fetch(String url,
      {Map<String, String>? body}) async {
    _http.Response response;

    try {
      final request =
          (body == null) ? _http.get(url) : _http.post(url, body: body);

      response = await request;
    } on SocketException catch (error) {
      throw TransportClientException(error.message);
    } on HttpException catch (error) {
      throw TransportClientException(error.message);
    } on TimeoutException catch (error) {
      throw TransportClientException(error.message);
    }

    return HttpClientResponse(
      response.statusCode,
      response.body,
      response.headers,
    );
  }
}
