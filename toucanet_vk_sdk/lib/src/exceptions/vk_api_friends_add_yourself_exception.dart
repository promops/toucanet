part of 'vk_exceptions.dart';

class VKApiFriendsAddYourselfException extends VKApiException {
  VKApiFriendsAddYourselfException([String message = ''])
      : super(174, 'Cannot add user himself as friend', message);
}
