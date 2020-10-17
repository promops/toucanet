part of 'vk_exceptions.dart';

class VKApiWallAdsPublishedException extends VKApiException {
  VKApiWallAdsPublishedException([String message = ''])
      : super(219, 'Advertisement post was recently added', message);
}
