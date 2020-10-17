part of 'vk_exceptions.dart';

class VKApiParamException extends VKApiException {
  VKApiParamException([String message = ''])
      : super(100, 'One of the parameters specified was missing or invalid',
            message);
}
