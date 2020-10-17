part of 'vk_exceptions.dart';

class VKApiRateLimitException extends VKApiException {
  VKApiRateLimitException([String message = ''])
      : super(29, 'Rate limit reached', message);
}
