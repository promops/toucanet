part of 'vk_api_exception.dart';

class VKApiMethodDisabledException extends VKApiException
{
  VKApiMethodDisabledException([String message]) :
    super(23, 'This method was disabled', message ?? '');
}