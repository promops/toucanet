part of 'vk_exceptions.dart';

class VKApiCompileException extends VKApiException {
  VKApiCompileException([String message = ''])
      : super(12, 'Unable to compile code', message);
}
