part of 'vk_exceptions.dart';

class VKApiRequestException extends VKApiException {
  VKApiRequestException([String message = ''])
      : super(8, 'Invalid request', message);
}
