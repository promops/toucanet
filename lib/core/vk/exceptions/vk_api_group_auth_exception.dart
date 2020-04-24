part of 'vk_api_exception.dart';

class VKApiGroupAuthException extends VKApiException
{
  VKApiGroupAuthException([String message]) :
    super(27, 'Group authorization failed', message ?? '');
}