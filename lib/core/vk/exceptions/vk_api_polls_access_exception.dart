part of 'vk_api_exception.dart';

class VKApiPollsAccessException extends VKApiException
{
  VKApiPollsAccessException([String message]) :
    super(250, 'Access to poll denied', message ?? '');
}