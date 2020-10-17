part of 'vk_exceptions.dart';

class VKApiParamTimestampException extends VKApiException {
  VKApiParamTimestampException([String message = ''])
      : super(150, 'Invalid timestamp', message);
}
