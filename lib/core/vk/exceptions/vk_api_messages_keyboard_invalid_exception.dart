import 'vk_api_exception.dart';

class VKApiMessagesKeyboardInvalidException extends VKApiException
{
  VKApiMessagesKeyboardInvalidException([String message]) :
    super(911, 'Keyboard format is invalid', message ?? '');
}