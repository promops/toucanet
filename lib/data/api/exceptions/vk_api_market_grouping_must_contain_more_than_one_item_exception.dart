part of 'vk_api_exception.dart';

class VKApiMarketGroupingMustContainMoreThanOneItemException extends VKApiException
{
  VKApiMarketGroupingMustContainMoreThanOneItemException([String message]) :
    super(1425, 'Grouping must have two or more items', message ?? '');
}