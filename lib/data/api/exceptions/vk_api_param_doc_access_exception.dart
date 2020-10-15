part of 'vk_api_exception.dart';

class VKApiParamDocAccessException extends VKApiException
{
  VKApiParamDocAccessException([String message]) :
    super(1153, 'Access to document is denied', message ?? '');
}