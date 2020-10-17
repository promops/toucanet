part of 'vk_exceptions.dart';

class VKApiMarketTooManyItemsException extends VKApiException {
  VKApiMarketTooManyItemsException([String message = ''])
      : super(1405, 'Too many items', message);
}
