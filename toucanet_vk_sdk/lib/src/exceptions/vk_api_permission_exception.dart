part of 'vk_exceptions.dart';

class VKApiPermissionException extends VKApiException {
  VKApiPermissionException([String message = ''])
      : super(7, 'Permission to perform this action is denied', message);
}
