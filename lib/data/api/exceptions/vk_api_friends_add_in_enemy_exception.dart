part of 'vk_api_exception.dart';

class VKApiFriendsAddInEnemyException extends VKApiException
{
  VKApiFriendsAddInEnemyException([String message]) :
    super(175, 'Cannot add this user to friends as they have put you on their blacklist', message ?? '');
}