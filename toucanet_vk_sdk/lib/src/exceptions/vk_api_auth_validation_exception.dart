part of 'vk_exceptions.dart';

class VKApiAuthValidationException extends VKApiException {
  VKApiAuthValidationException([String message = ''])
      : super(17, 'Validation required', message);
}
