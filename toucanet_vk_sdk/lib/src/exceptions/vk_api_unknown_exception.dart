part of 'vk_exceptions.dart';

class VKApiUnknownException extends VKApiException {
  VKApiUnknownException([String message = ''])
      : super(1, 'Unknown error occurred', message);
}
