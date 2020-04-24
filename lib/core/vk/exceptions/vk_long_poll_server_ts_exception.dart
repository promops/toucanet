part of 'vk_api_exception.dart';

class VKLongPollServerTsException extends VKApiException
{
  VKLongPollServerTsException([String message]) :
    super(1, 'Incorrect \'ts\' value', message ?? '');
}