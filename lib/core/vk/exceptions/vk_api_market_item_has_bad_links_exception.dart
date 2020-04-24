import 'vk_api_exception.dart';

class VKApiMarketItemHasBadLinksException extends VKApiException
{
  VKApiMarketItemHasBadLinksException([String message]) :
    super(1408, 'Item has bad links in description', message ?? '');
}