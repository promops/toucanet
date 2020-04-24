part of 'vk_api_exception.dart';

class VKApiAuthDelayException extends VKApiException
{
  VKApiAuthDelayException([String message]) :
    super(1112, 'Processing.. Try later', message ?? '');
}