part of 'vk_api_exception.dart';

class VKApiGroupNotInClubException extends VKApiException
{
  VKApiGroupNotInClubException([String message]) :
    super(701, 'User should be in club', message ?? '');
}