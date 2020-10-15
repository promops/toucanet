part of 'vk_api_exception.dart';

class VKApiStatusNoAudioException extends VKApiException
{
  VKApiStatusNoAudioException([String message]) :
    super(221, 'User disabled track name broadcast', message ?? '');
}