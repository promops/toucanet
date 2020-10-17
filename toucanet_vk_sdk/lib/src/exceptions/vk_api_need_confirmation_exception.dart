part of 'vk_exceptions.dart';

class VKApiNeedConfirmationException extends VKApiException {
  VKApiNeedConfirmationException([String message = ''])
      : super(24, 'Confirmation required', message);
}
