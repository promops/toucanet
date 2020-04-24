import 'vk_api_exception.dart';

class VKApiRequestException extends VKApiException
{
  VKApiRequestException([String message]) :
    super(8, 'Invalid request', message ?? '');
}