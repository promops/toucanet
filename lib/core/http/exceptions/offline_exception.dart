import 'dart:io';

class OfflineException implements HttpException 
{
  final String message = 'Нет подключения к интернету.';

  OfflineException();

  @override
  Uri get uri => null;

  @override
  String toString() => message;
}