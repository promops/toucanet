import 'vk_api_exception.dart';

class VKApiAdsSpecificException extends VKApiException
{
  VKApiAdsSpecificException([String message]) :
    super(603, 'Some ads error occured', message ?? '');
}