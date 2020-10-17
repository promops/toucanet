part of 'vk_exceptions.dart';

class VKApiMessagesDenySendException extends VKApiException {
  VKApiMessagesDenySendException([String message = ''])
      : super(901, "Can't send messages for users without permission", message);
}
