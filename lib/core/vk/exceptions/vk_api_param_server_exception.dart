import 'vk_api_exception.dart';

class VKApiParamServerException extends VKApiException
{
  VKApiParamServerException([String message]) :
    super(118, 'Invalid server', message ?? '');
}