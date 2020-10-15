part of 'vk_api_exception.dart';

class VKLongPollServerTsException extends VKLongPollException {
  VKLongPollServerTsException([String message])
      : super(1, "Incorrect 'ts' value", message ?? '');
}
