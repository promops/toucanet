part of 'vk_exceptions.dart';

class VKApiMessagesContactNotFoundException extends VKApiException {
  VKApiMessagesContactNotFoundException([String message = ''])
      : super(936, 'Contact not found', message);
}
