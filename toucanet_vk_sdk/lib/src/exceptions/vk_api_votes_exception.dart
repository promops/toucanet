part of 'vk_exceptions.dart';

class VKApiVotesException extends VKApiException {
  VKApiVotesException([String message = ''])
      : super(503, 'Not enough votes', message);
}
