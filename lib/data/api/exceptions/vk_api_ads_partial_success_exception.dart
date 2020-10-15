part of 'vk_api_exception.dart';

class VKApiAdsPartialSuccessException extends VKApiException
{
  VKApiAdsPartialSuccessException([String message]) :
    super(602, 'Some part of the request has not been completed', message ?? '');
}