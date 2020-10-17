part of 'vk_exceptions.dart';

class VKApiInvalidAddressException extends VKApiException {
  VKApiInvalidAddressException([String message = ''])
      : super(1260, 'Invalid screen name', message);
}
