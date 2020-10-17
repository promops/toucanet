part of 'vk_exceptions.dart';

class VKApiParamHashException extends VKApiException {
  VKApiParamHashException([String message = ''])
      : super(121, 'Invalid hash', message);
}
