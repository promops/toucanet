part of 'vk_api_exception.dart';

class VKApiLimitsException extends VKApiException
{
  VKApiLimitsException([String message]) :
    super(103, 'Out of limits', message ?? '');
}