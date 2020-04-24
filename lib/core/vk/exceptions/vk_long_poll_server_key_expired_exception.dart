part of 'vk_api_exception.dart';

class VKLongPollServerKeyExpiredException extends VKApiException
{
  VKLongPollServerKeyExpiredException([String message]) :
    super(2, 'Long poll server key expired', message ?? '');
}