import 'vk_api_exception.dart';

class VKApiCallbackApiServersLimitException extends VKApiException
{
  VKApiCallbackApiServersLimitException([String message]) :
    super(2000, 'Servers number limit is reached', message ?? '');
}