part of 'vk_exceptions.dart';

class VKApiServerException extends VKApiException {
  VKApiServerException([String message = ''])
      : super(10, 'Internal server error', message);
}
