import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as _http;

import 'exceptions/offline_exception.dart';
import 'exceptions/response_format_exception.dart';
import 'exceptions/server_unavailable_exception.dart';

part 'http_response.dart';

class Http 
{
  final int connectTimeout;

  Http([this.connectTimeout = 0]);

  Future<HttpResponse> get(String url, {Map<String, String> headers}) async => 
    await this._request(url, headers: headers ?? {});

  Future<HttpResponse> post(String url, {body, Map<String, String> headers}) async => 
    await this._request(url, body: body ?? {}, headers: headers ?? {});
    
  Future<HttpResponse> _request(String url, {body, Map<String, String> headers}) async 
  {
    try {
      Future<_http.Response> request = (body == null) ? 
        _http.get(url, headers: headers) : 
        _http.post(url, body: body, headers: headers);

      _http.Response response = this.connectTimeout <= 0 ?
        await request :
        await request.timeout(Duration(milliseconds: this.connectTimeout));
      return this._transformResponse(response);
    }
    on  SocketException catch (_) { throw OfflineException(); }
    on    HttpException catch (_) { throw ServerUnavailableException(); }
    on TimeoutException catch (_) { throw ServerUnavailableException(); }
    catch (exception) { 
      throw ResponseFormatException(); 
    }
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
