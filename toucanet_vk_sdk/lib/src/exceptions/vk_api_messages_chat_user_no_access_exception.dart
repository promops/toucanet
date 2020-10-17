part of 'vk_exceptions.dart';

class VKApiMessagesChatUserNoAccessException extends VKApiException {
  VKApiMessagesChatUserNoAccessException([String message = ''])
      : super(917, "You don't have access to this chat", message);
}
