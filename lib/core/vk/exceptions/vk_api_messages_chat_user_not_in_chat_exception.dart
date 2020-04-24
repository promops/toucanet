import 'vk_api_exception.dart';

class VKApiMessagesChatUserNotInChatException extends VKApiException
{
  VKApiMessagesChatUserNotInChatException([String message]) :
    super(935, 'User not found in chat', message ?? '');
}