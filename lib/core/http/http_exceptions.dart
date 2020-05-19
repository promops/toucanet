part of 'http.dart';

class HttpOfflineException extends HttpException 
{
  HttpOfflineException(String message, [Uri uri]) : 
    super(message, uri: uri);
}

class HttpResponseFormatException extends HttpException 
{
  HttpResponseFormatException(String message, [Uri uri]) : 
    super(message, uri: uri);
}

class HttpServerUnavailableException extends HttpException 
{
  HttpServerUnavailableException(String message, [Uri uri]) :
    super(message, uri: uri);
}