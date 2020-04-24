import 'vk_api_exception.dart';

class VKApiAppsAlreadyUnlockedException extends VKApiException
{
  VKApiAppsAlreadyUnlockedException([String message]) :
    super(1251, 'This achievement is already unlocked', message ?? '');
}