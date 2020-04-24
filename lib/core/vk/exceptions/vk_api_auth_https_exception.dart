part of 'vk_api_exception.dart';

class VKApiAuthHttpsException extends VKApiException
{
  VKApiAuthHttpsException([String message]) :
    super(16, 'HTTP authorization failed', message ?? '');
}