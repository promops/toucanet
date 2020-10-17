part of 'vk_exceptions.dart';

class VKApiPollsAnswerIdException extends VKApiException {
  VKApiPollsAnswerIdException([String message = ''])
      : super(252, 'Invalid answer id', message);
}
