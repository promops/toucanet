part of 'vk_exceptions.dart';

class VKApiPrettyCardsCardIsConnectedToPostException extends VKApiException {
  VKApiPrettyCardsCardIsConnectedToPostException([String message = ''])
      : super(1902, 'Card is connected to post', message);
}
