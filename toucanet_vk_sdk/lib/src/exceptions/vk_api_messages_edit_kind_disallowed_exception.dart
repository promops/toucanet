part of 'vk_exceptions.dart';

class VKApiMessagesEditKindDisallowedException extends VKApiException {
  VKApiMessagesEditKindDisallowedException([String message = ''])
      : super(920, "Can't edit this kind of message", message);
}
