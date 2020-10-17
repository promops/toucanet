part of 'vk_exceptions.dart';

class VKApiMessagesMessageRequestAlreadySentException extends VKApiException {
  VKApiMessagesMessageRequestAlreadySentException([String message = ''])
      : super(939, 'Message request already sent', message);
}
