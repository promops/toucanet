part of 'vk_exceptions.dart';

class VKApiNeedTokenConfirmationException extends VKApiException {
  VKApiNeedTokenConfirmationException([String message = ''])
      : super(25, 'Token confirmation required', message);
}
