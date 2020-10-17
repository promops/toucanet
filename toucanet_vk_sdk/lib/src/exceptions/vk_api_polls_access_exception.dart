part of 'vk_exceptions.dart';

class VKApiPollsAccessException extends VKApiException {
  VKApiPollsAccessException([String message = ''])
      : super(250, 'Access to poll denied', message);
}
