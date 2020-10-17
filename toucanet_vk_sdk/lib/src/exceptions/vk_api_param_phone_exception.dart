part of 'vk_exceptions.dart';

class VKApiParamPhoneException extends VKApiException {
  VKApiParamPhoneException([String message = ''])
      : super(1000, 'Invalid phone number', message);
}
