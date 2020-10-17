part of 'vk_exceptions.dart';

class VKApiMarketItemAlreadyAddedException extends VKApiException {
  VKApiMarketItemAlreadyAddedException([String message = ''])
      : super(1404, 'Item already added to album', message);
}
