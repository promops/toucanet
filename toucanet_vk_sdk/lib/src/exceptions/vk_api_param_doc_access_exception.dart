part of 'vk_exceptions.dart';

class VKApiParamDocAccessException extends VKApiException {
  VKApiParamDocAccessException([String message = ''])
      : super(1153, 'Access to document is denied', message);
}
