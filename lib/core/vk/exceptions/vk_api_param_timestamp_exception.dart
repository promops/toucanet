part of 'vk_api_exception.dart';

class VKApiParamTimestampException extends VKApiException
{
  VKApiParamTimestampException([String message]) :
    super(150, 'Invalid timestamp', message ?? '');
}