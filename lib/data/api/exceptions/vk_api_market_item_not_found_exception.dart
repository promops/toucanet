part of 'vk_api_exception.dart';

class VKApiMarketItemNotFoundException extends VKApiException
{
  VKApiMarketItemNotFoundException([String message]) :
    super(1403, 'Item not found', message ?? '');
}