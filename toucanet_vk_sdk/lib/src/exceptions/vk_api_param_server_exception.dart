part of 'vk_exceptions.dart';

class VKApiParamServerException extends VKApiException {
  VKApiParamServerException([String message = ''])
      : super(118, 'Invalid server', message);
}
