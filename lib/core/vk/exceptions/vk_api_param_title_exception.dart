import 'vk_api_exception.dart';

class VKApiParamTitleException extends VKApiException
{
  VKApiParamTitleException([String message]) :
    super(119, 'Invalid title', message ?? '');
}