import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as _http;

part 'http_response.dart';
part 'http_exceptions.dart';

class Http 
{
  Future<HttpResponse> get(
    String url, {
      int connectTimeout = 0,
      Map<String, String> headers = const {}, 
      Map<String, String> parameters = const {}
  }) 
  async => this._fetch(url, headers: headers, connectTimeout: connectTimeout);

  Future<HttpResponse> post(
    String url, {
    int connectTimeout = 0,
    Map<String, String> body = const {}, 
    Map<String, String> headers = const {},
    Map<String, String> parameters = const {}, 
  }) 
  async => this._fetch(url, body: body, headers: headers, connectTimeout: connectTimeout);
    
  Future<HttpResponse> _fetch(
    String url, {
    int connectTimeout,
    Map<String, String> body, 
    Map<String, String> headers
  }) async 
  {
    _http.Response response;
    
    if (connectTimeout > 0) {
      headers['connection'] ??= 'keep-alive';
    }

    try {
      final request = (body == null) ? 
        _http.get(url, headers: headers) : 
        _http.post(url, body: body, headers: headers);

      response = connectTimeout <= 0 ?
        await request :
        await request.timeout(Duration(milliseconds: connectTimeout));
    }
    on SocketException catch (error) { 
      throw HttpOfflineException(error.message); 
    }
    on HttpException catch (error) { 
      throw HttpServerUnavailableException(error.message, error.uri);
    }
    on TimeoutException catch (error) { 
      throw HttpServerUnavailableException(error.message); 
    }

    try {
      return this._transformResponse(response);
    }
    catch (_) { throw HttpResponseFormatException(''); }
  }

  HttpResponse _transformResponse(_http.Response response)
  {
    String contentType = response.headers['content-type'] ?? '';

    if (contentType.contains('application/json'))
    {
      return HttpResponse<Map<String, dynamic>>(
        json.decode(response.body), 
        response.statusCode, response.headers
      );
    }
      
    return HttpResponse(response.body, response.statusCode, response.headers);
  }
}
