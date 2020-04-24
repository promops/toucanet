import 'vk_api_exception.dart';

class VKApiFriendsAddNotFoundException extends VKApiException
{
  VKApiFriendsAddNotFoundException([String message]) :
    super(177, 'Cannot add this user to friends as user not found', message ?? '');
}