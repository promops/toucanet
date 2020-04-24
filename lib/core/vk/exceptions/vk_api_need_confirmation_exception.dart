import 'vk_api_exception.dart';

class VKApiNeedConfirmationException extends VKApiException
{
  VKApiNeedConfirmationException([String message]) :
    super(24, 'Confirmation required', message ?? '');
}