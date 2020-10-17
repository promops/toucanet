part of 'vk_exceptions.dart';

class VKApiSignatureException extends VKApiException {
  VKApiSignatureException([String message = ''])
      : super(4, 'Incorrect signature', message);
}
