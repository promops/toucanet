import 'vk_api_exception.dart';

class VKApiMessagesChatNotAdminException extends VKApiException
{
  VKApiMessagesChatNotAdminException([String message]) :
    super(925, 'You are not admin of this chat', message ?? '');
}