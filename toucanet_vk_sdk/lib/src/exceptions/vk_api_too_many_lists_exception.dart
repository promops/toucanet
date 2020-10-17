part of 'vk_exceptions.dart';

class VKApiTooManyListsException extends VKApiException {
  VKApiTooManyListsException([String message = ''])
      : super(1170, 'Too many feed lists', message);
}
