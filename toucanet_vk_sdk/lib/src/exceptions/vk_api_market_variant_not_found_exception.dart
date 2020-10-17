part of 'vk_exceptions.dart';

class VKApiMarketVariantNotFoundException extends VKApiException {
  VKApiMarketVariantNotFoundException([String message = ''])
      : super(1416, 'Variant not found', message);
}
