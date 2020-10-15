part of 'vk_api_exception.dart';

class VKApiAppAuthException extends VKApiException
{
  VKApiAppAuthException([String message]) :
    super(28, 'Application authorization failed', message ?? '');
}