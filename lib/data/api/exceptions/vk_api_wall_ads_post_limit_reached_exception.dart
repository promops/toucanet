part of 'vk_api_exception.dart';

class VKApiWallAdsPostLimitReachedException extends VKApiException
{
  VKApiWallAdsPostLimitReachedException([String message]) :
    super(224, 'Too many ads posts', message ?? '');
}