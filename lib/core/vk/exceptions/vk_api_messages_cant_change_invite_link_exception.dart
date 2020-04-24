import 'vk_api_exception.dart';

class VKApiMessagesCantChangeInviteLinkException extends VKApiException
{
  VKApiMessagesCantChangeInviteLinkException([String message]) :
    super(931, 'You can\'t change invite link for this chat', message ?? '');
}