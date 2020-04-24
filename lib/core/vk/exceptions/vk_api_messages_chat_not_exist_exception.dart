import 'vk_api_exception.dart';

class VKApiMessagesChatNotExistException extends VKApiException
{
  VKApiMessagesChatNotExistException([String message]) :
    super(927, 'Chat does not exist', message ?? '');
}