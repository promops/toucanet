part of 'vk_exceptions.dart';

class VKApiMarketItemHasBadLinksException extends VKApiException {
  VKApiMarketItemHasBadLinksException([String message = ''])
      : super(1408, 'Item has bad links in description', message);
}
