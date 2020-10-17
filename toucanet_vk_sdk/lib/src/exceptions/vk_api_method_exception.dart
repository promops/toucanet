part of 'vk_exceptions.dart';

class VKApiMethodException extends VKApiException {
  VKApiMethodException([String message = ''])
      : super(3, 'Unknown method passed', message);
}
