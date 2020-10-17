part of 'vk_exceptions.dart';

class VKLongPollException extends VKApiException {
  VKLongPollException(
      [int code = 0,
      String description =
          'Unknown LongPollServer exception, something went wrong',
      String message = ''])
      : super(code, description, message);
}
