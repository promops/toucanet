part of 'vk_api_exception.dart';

class VKApiParamHashException extends VKApiException
{
  VKApiParamHashException([String message]) :
    super(121, 'Invalid hash', message ?? '');
}