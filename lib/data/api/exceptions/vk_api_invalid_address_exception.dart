part of 'vk_api_exception.dart';

class VKApiInvalidAddressException extends VKApiException
{
  VKApiInvalidAddressException([String message]) :
    super(1260, 'Invalid screen name', message ?? '');
}