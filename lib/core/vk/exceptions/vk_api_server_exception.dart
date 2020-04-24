part of 'vk_api_exception.dart';

class VKApiServerException extends VKApiException
{
  VKApiServerException([String message]) :
    super(10, 'Internal server error', message ?? '');
}