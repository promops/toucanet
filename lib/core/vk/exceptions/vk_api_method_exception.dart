import 'vk_api_exception.dart';

class VKApiMethodException extends VKApiException
{
  VKApiMethodException([String message]) :
    super(3, 'Unknown method passed', message ?? '');
}