import 'vk_api_exception.dart';

class VKApiAdsPermissionException extends VKApiException
{
  VKApiAdsPermissionException([String message]) :
    super(600, 'Permission denied. You have no access to operations specified with given object(s)', message ?? '');
}