part of 'vk_exceptions.dart';

class VKApiGroupNotInClubException extends VKApiException {
  VKApiGroupNotInClubException([String message = ''])
      : super(701, 'User should be in club', message);
}
