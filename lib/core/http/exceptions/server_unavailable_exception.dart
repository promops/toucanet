import 'dart:io';

class ServerUnavailableException implements HttpException 
{
  final String message = 'Сервер не отвечает.';

  ServerUnavailableException();

  @override
  Uri get uri => null;

  @override
  String toString() => message;
}