part of 'vk_api_exception.dart';

class VKApiAdsObjectDeletedException extends VKApiException
{
  VKApiAdsObjectDeletedException([String message]) :
    super(629, 'Object deleted', message ?? '');
}