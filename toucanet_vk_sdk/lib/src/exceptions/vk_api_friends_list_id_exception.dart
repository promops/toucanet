part of 'vk_exceptions.dart';

class VKApiFriendsListIdException extends VKApiException {
  VKApiFriendsListIdException([String message = ''])
      : super(171, 'Invalid list id', message);
}
