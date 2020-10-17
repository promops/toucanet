part of 'vk_exceptions.dart';

class VKApiAuthDelayException extends VKApiException {
  VKApiAuthDelayException([String message = ''])
      : super(1112, 'Processing.. Try later', message);
}
