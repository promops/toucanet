import 'vk_api_exception.dart';

class VKApiWallAdsPublishedException extends VKApiException
{
  VKApiWallAdsPublishedException([String message]) :
    super(219, 'Advertisement post was recently added', message ?? '');
}