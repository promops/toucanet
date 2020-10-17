part of 'vk_exceptions.dart';

class VKApiAuthFloodErrorException extends VKApiException {
  VKApiAuthFloodErrorException([String message = ''])
      : super(1105, 'Too many auth attempts, try again later', message);
}
