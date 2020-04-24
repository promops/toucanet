part of 'vk_api_exception.dart';

class VKApiPermissionException extends VKApiException
{
  VKApiPermissionException([String message]) :
    super(7, 'Permission to perform this action is denied', message ?? '');
}