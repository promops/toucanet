part of 'vk_exceptions.dart';

class VKApiGroupAuthException extends VKApiException {
  VKApiGroupAuthException([String message = ''])
      : super(27, 'Group authorization failed', message);
}
