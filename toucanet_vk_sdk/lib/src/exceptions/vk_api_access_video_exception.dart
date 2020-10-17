part of 'vk_exceptions.dart';

class VKApiAccessVideoException extends VKApiException {
  VKApiAccessVideoException([String message = ''])
      : super(204, 'Access denied', message);
}
