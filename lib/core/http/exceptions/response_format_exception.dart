import 'dart:io';

class ResponseFormatException implements HttpException 
{
  final String message = 'Неизвестный формат ответа.';

  ResponseFormatException();

  @override
  Uri get uri => null;

  @override
  String toString() => message;
}