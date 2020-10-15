part of 'vk_api_exception.dart';

class VKApiMessagesGroupPeerAccessException extends VKApiException {
  VKApiMessagesGroupPeerAccessException([String message])
      : super(
            932, "Your community can't interact with this peer", message ?? '');
}
