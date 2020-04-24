part of 'vk_api_exception.dart';

class VKApiPollsPollIdException extends VKApiException
{
  VKApiPollsPollIdException([String message]) :
    super(251, 'Invalid poll id', message ?? '');
}