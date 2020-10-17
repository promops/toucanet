part of 'vk_exceptions.dart';

class VKApiAppsAlreadyUnlockedException extends VKApiException {
  VKApiAppsAlreadyUnlockedException([String message = ''])
      : super(1251, 'This achievement is already unlocked', message);
}
