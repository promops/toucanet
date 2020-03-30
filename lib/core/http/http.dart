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

  Future<HttpResponse> get(String url) async => await this._request(url);
  Future<HttpResponse> post(String url, {body}) async => await this._request(url, body: body ?? {});
    
  Future<HttpResponse> _request(String url, {body}) async 
  {
    try {
      Future<_http.Response> request; 
      request = body == null ? _http.get(url) : _http.post(url, body: body);

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
