part of 'vk_exceptions.dart';

class VKApiMarketGroupingMustContainMoreThanOneItemException
    extends VKApiException {
  VKApiMarketGroupingMustContainMoreThanOneItemException([String message = ''])
      : super(1425, 'Grouping must have two or more items', message);
}
