part of 'vk_exceptions.dart';

class VKApiAccessAudioException extends VKApiException {
  VKApiAccessAudioException([String message = ''])
      : super(201, 'Access denied', message);
}
