part of 'vk_api_exception.dart';

class VKApiMessagesPrivacyException extends VKApiException {
  VKApiMessagesPrivacyException([String message])
      : super(
            902,
            "Can't send messages to this user due to their privacy settings",
            message ?? '');
}
