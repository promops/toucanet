part of 'vk_api_exception.dart';

class VKApiNeedTokenConfirmationException extends VKApiException
{
  VKApiNeedTokenConfirmationException([String message]) :
    super(25, 'Token confirmation required', message ?? '');
}