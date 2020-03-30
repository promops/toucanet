part 'vk_auth_exceptions.dart';

abstract class VKException implements Exception 
{
  final int code;
  final String message;

  VKException({this.code, this.message = ''});

  @override
  String toString() => '$code: $message';
}