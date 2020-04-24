import 'vk_api_exception.dart';

class VKApiMessagesCantSeeInviteLinkException extends VKApiException
{
  VKApiMessagesCantSeeInviteLinkException([String message]) :
    super(919, 'You can\'t see invite link for this chat', message ?? '');
}