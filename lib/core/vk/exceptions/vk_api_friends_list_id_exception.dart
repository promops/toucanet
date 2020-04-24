import 'vk_api_exception.dart';

class VKApiFriendsListIdException extends VKApiException
{
  VKApiFriendsListIdException([String message]) :
    super(171, 'Invalid list id', message ?? '');
}