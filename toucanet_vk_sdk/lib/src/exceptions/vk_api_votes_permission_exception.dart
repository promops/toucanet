part of 'vk_exceptions.dart';

class VKApiVotesPermissionException extends VKApiException {
  VKApiVotesPermissionException([String message = ''])
      : super(
            500,
            'Permission denied. You must enable votes processing in application settings',
            message);
}
