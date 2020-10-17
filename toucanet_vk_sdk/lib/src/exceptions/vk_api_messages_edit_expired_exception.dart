part of 'vk_exceptions.dart';

class VKApiMessagesEditExpiredException extends VKApiException {
  VKApiMessagesEditExpiredException([String message = ''])
      : super(909, "Can't edit this message, because it's too old", message);
}
