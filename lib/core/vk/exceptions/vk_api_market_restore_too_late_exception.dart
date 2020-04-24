import 'vk_api_exception.dart';

class VKApiMarketRestoreTooLateException extends VKApiException
{
  VKApiMarketRestoreTooLateException([String message]) :
    super(1400, 'Too late for restore', message ?? '');
}