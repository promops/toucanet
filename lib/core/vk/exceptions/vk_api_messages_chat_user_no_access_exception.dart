part of 'vk_api_exception.dart';

class VKApiMessagesChatUserNoAccessException extends VKApiException
{
  VKApiMessagesChatUserNoAccessException([String message]) :
    super(917, 'You don\'t have access to this chat', message ?? '');
}