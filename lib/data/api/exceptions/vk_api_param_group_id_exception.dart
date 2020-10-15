part of 'vk_api_exception.dart';

class VKApiParamGroupIdException extends VKApiException
{
  VKApiParamGroupIdException([String message]) :
    super(125, 'Invalid group id', message ?? '');
}