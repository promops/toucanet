part of 'vk_api_exception.dart';

class VKApiMarketGroupingItemsMustHaveDistinctPropertiesException extends VKApiException
{
  VKApiMarketGroupingItemsMustHaveDistinctPropertiesException([String message]) :
    super(1426, 'Item must have distinct properties', message ?? '');
}