part of 'vk_api_exception.dart';

class VKApiMessagesTooBigException extends VKApiException
{
  VKApiMessagesTooBigException([String message]) :
    super(910, 'Can\'t sent this message, because it\'s too big', message ?? '');
}