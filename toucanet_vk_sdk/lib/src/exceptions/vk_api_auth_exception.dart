part of 'vk_exceptions.dart';

class VKApiAuthException extends VKApiException {
  VKApiAuthException([String message = ''])
      : super(5, 'User authorization failed', message);
}
