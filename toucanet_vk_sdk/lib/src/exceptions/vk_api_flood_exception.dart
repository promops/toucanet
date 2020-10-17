part of 'vk_exceptions.dart';

class VKApiFloodException extends VKApiException {
  VKApiFloodException([String message = ''])
      : super(9, 'Flood control', message);
}
