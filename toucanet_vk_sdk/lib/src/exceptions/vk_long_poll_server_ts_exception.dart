part of 'vk_exceptions.dart';

class VKLongPollServerTsException extends VKLongPollException {
  VKLongPollServerTsException([String message = ''])
      : super(1, "Incorrect 'ts' value", message);
}
