part of 'vk_exceptions.dart';

class VKApiParamPageIdException extends VKApiException {
  VKApiParamPageIdException([String message = ''])
      : super(140, 'Page not found', message);
}
