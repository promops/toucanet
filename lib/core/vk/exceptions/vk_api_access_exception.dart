import 'vk_api_exception.dart';

class VKApiAccessException extends VKApiException
{
  VKApiAccessException([String message]) :
    super(15, 'Access denied', message ?? '');
}