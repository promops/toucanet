part of 'vk_exceptions.dart';

class VKApiMessagesTooLongMessageException extends VKApiException {
  VKApiMessagesTooLongMessageException([String message = ''])
      : super(914, 'Message is too long', message);
}
