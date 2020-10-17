part of 'vk_exceptions.dart';

class VKApiMessagesTooLongForwardsException extends VKApiException {
  VKApiMessagesTooLongForwardsException([String message = ''])
      : super(913, 'Too many forwarded messages', message);
}
