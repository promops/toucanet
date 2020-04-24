import 'vk_api_exception.dart';

class VKApiTooManyException extends VKApiException
{
  VKApiTooManyException([String message]) :
    super(6, 'Too many requests per second', message ?? '');
}