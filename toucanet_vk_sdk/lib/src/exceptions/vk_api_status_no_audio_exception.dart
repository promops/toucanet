part of 'vk_exceptions.dart';

class VKApiStatusNoAudioException extends VKApiException {
  VKApiStatusNoAudioException([String message = ''])
      : super(221, 'User disabled track name broadcast', message);
}
