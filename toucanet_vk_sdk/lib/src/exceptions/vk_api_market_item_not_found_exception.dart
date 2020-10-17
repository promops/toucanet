part of 'vk_exceptions.dart';

class VKApiMarketItemNotFoundException extends VKApiException {
  VKApiMarketItemNotFoundException([String message = ''])
      : super(1403, 'Item not found', message);
}
