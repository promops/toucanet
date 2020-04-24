import 'vk_api_exception.dart';

class VKApiPrettyCardsCardNotFoundException extends VKApiException
{
  VKApiPrettyCardsCardNotFoundException([String message]) :
    super(1900, 'Card not found', message ?? '');
}