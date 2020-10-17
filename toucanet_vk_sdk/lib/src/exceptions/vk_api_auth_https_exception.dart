part of 'vk_exceptions.dart';

class VKApiAuthHttpsException extends VKApiException {
  VKApiAuthHttpsException([String message = ''])
      : super(16, 'HTTP authorization failed', message);
}
