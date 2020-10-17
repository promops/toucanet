part of 'vk_exceptions.dart';

class VKApiMethodPermissionException extends VKApiException {
  VKApiMethodPermissionException([String message = ''])
      : super(
            20,
            'Permission to perform this action is denied for non-standalone applications',
            message);
}
