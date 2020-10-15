part of 'vk_api_exception.dart';

class VKApiMessagesDenySendException extends VKApiException {
  VKApiMessagesDenySendException([String message])
      : super(901, "Can't send messages for users without permission",
            message ?? '');
}
