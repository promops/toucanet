part of 'http.dart';

enum HttpResponseType {plain, json}

class HttpResponse<T>
{
  final T body;
  final int statusCode;
  final Map<String, String> headers;

  HttpResponse(this.body, this.statusCode, [this.headers = const {}]);

  HttpResponseType get responseType => 
    body is Map ? HttpResponseType.json : HttpResponseType.plain;

  @override
  String toString() {
    return body is Map ? json.encode(body) : body.toString();
  }
}