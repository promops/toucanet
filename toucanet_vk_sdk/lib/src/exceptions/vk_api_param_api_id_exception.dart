part of 'vk_exceptions.dart';

class VKApiParamApiIdException extends VKApiException {
  VKApiParamApiIdException([String message = ''])
      : super(101, 'Invalid application API ID', message);
}
