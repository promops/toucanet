part of 'vk_api_exception.dart';

class VKApiRateLimitException extends VKApiException
{
  VKApiRateLimitException([String message]) :
    super(29, 'Rate limit reached', message ?? '');
}