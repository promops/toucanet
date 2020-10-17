part of 'vk_exceptions.dart';

class VKApiPrettyCardsCardNotFoundException extends VKApiException {
  VKApiPrettyCardsCardNotFoundException([String message = ''])
      : super(1900, 'Card not found', message);
}
