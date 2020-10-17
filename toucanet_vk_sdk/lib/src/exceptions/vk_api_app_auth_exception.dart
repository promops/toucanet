part of 'vk_exceptions.dart';

class VKApiAppAuthException extends VKApiException {
  VKApiAppAuthException([String message = ''])
      : super(28, 'Application authorization failed', message);
}
