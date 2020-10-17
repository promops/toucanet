part of 'vk_exceptions.dart';

class VKApiMessagesUserBlockedException extends VKApiException {
  VKApiMessagesUserBlockedException([String message = ''])
      : super(
          900,
          "Can't send messages for users from blacklist",
          message,
        );
}
