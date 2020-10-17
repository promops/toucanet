part of 'vk_exceptions.dart';

class VKApiCallbackApiServersLimitException extends VKApiException {
  VKApiCallbackApiServersLimitException([String message = ''])
      : super(2000, 'Servers number limit is reached', message);
}
