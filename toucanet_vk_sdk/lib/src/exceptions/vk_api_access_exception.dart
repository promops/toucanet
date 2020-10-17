part of 'vk_exceptions.dart';

class VKApiAccessException extends VKApiException {
  VKApiAccessException([String message = ''])
      : super(15, 'Access denied', message);
}
