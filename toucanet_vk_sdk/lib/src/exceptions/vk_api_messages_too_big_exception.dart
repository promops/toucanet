part of 'vk_exceptions.dart';

class VKApiMessagesTooBigException extends VKApiException {
  VKApiMessagesTooBigException([String message = ''])
      : super(910, "Can't sent this message, because it's too big", message);
}
