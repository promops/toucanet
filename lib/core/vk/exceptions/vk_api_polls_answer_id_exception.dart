part of 'vk_api_exception.dart';

class VKApiPollsAnswerIdException extends VKApiException
{
  VKApiPollsAnswerIdException([String message]) :
    super(252, 'Invalid answer id', message ?? '');
}