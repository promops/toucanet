part of 'vk_api_exception.dart';

class VKApiAccessAudioException extends VKApiException
{
  VKApiAccessAudioException([String message]) :
    super(201, 'Access denied', message ?? '');
}