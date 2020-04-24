part of 'vk_api_exception.dart';

class VKApiMessagesUserBlockedException extends VKApiException
{
  VKApiMessagesUserBlockedException([String message]) :
    super(900, 'Can\'t send messages for users from blacklist', message ?? '');
}