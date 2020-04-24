part of 'vk_api_exception.dart';

class VKApiMessagesMessageRequestAlreadySentException extends VKApiException
{
  VKApiMessagesMessageRequestAlreadySentException([String message]) :
    super(939, 'Message request already sent', message ?? '');
}