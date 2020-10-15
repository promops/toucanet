part of 'vk_api_exception.dart';

class VKApiMarketTooManyItemsException extends VKApiException
{
  VKApiMarketTooManyItemsException([String message]) :
    super(1405, 'Too many items', message ?? '');
}