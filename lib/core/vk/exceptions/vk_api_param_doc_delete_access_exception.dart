part of 'vk_api_exception.dart';

class VKApiParamDocDeleteAccessException extends VKApiException
{
  VKApiParamDocDeleteAccessException([String message]) :
    super(1151, 'Access to document deleting is denied', message ?? '');
}