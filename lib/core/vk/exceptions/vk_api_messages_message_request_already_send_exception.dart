part of 'vk_api_exception.dart';

class VKApiMessagesMessageRequestAlreadySendException extends VKApiException
{
  VKApiMessagesMessageRequestAlreadySendException([String message]) :
    super(939, 'Message request already send', message ?? '');
}