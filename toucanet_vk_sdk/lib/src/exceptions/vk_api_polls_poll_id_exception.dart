part of 'vk_exceptions.dart';

class VKApiPollsPollIdException extends VKApiException {
  VKApiPollsPollIdException([String message = ''])
      : super(251, 'Invalid poll id', message);
}
