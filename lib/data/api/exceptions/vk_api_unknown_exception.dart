part of 'vk_api_exception.dart';

class VKApiUnknownException extends VKApiException
{
  VKApiUnknownException([String message]) :
    super(1, 'Unknown error occurred', message ?? '');
}