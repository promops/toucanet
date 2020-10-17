part of 'vk_exceptions.dart';

class VKApiLongPollException extends VKApiException {
  VKApiLongPollException([String message = ''])
      : super(2100, 'LongPoll is not available for this group', message);
}
