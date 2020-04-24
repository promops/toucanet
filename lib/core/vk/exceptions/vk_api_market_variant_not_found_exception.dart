import 'vk_api_exception.dart';

class VKApiMarketVariantNotFoundException extends VKApiException
{
  VKApiMarketVariantNotFoundException([String message]) :
    super(1416, 'Variant not found', message ?? '');
}