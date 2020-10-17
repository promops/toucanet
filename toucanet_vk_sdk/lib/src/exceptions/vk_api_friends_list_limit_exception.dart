part of 'vk_exceptions.dart';

class VKApiFriendsListLimitException extends VKApiException {
  VKApiFriendsListLimitException([String message = ''])
      : super(173, 'Reached the maximum number of lists', message);
}
