part of 'vk_exceptions.dart';

class VKApiWallAdsPostLimitReachedException extends VKApiException {
  VKApiWallAdsPostLimitReachedException([String message = ''])
      : super(224, 'Too many ads posts', message);
}
