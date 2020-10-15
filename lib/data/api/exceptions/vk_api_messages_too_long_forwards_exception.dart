part of 'vk_api_exception.dart';

class VKApiMessagesTooLongForwardsException extends VKApiException
{
  VKApiMessagesTooLongForwardsException([String message]) :
    super(913, 'Too many forwarded messages', message ?? '');
}