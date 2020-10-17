part of 'vk_exceptions.dart';

class VKApiMessagesChatNotExistException extends VKApiException {
  VKApiMessagesChatNotExistException([String message = ''])
      : super(927, 'Chat does not exist', message);
}
