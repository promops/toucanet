part of 'vk_exceptions.dart';

class VKApiMarketPropertyNotFoundException extends VKApiException {
  VKApiMarketPropertyNotFoundException([String message = ''])
      : super(1417, 'Property not found', message);
}
