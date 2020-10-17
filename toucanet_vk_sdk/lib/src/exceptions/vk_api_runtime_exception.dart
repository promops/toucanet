part of 'vk_exceptions.dart';

class VKApiRuntimeException extends VKApiException {
  VKApiRuntimeException([String message = ''])
      : super(13, 'Runtime error occurred during code invocation', message);
}
