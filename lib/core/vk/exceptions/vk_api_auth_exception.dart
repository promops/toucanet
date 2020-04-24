import 'vk_api_exception.dart';

class VKApiAuthException extends VKApiException
{
  VKApiAuthException([String message]) :
    super(5, 'User authorization failed', message ?? '');
}