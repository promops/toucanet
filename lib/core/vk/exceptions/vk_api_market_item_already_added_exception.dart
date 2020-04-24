import 'vk_api_exception.dart';

class VKApiMarketItemAlreadyAddedException extends VKApiException
{
  VKApiMarketItemAlreadyAddedException([String message]) :
    super(1404, 'Item already added to album', message ?? '');
}