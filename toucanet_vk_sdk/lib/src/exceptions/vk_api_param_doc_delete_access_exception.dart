part of 'vk_exceptions.dart';

class VKApiParamDocDeleteAccessException extends VKApiException {
  VKApiParamDocDeleteAccessException([String message = ''])
      : super(1151, 'Access to document deleting is denied', message);
}
