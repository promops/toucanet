import 'vk_api_exception.dart';

class VKApiParamPageIdException extends VKApiException
{
  VKApiParamPageIdException([String message]) :
    super(140, 'Page not found', message ?? '');
}