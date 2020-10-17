part of 'vk_exceptions.dart';

class VKApiPrettyCardsTooManyCardsException extends VKApiException {
  VKApiPrettyCardsTooManyCardsException([String message = ''])
      : super(1901, 'Too many cards', message);
}
