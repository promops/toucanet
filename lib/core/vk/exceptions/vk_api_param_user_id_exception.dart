import 'vk_api_exception.dart';

class VKApiParamUserIdException extends VKApiException
{
  VKApiParamUserIdException([String message]) :
    super(113, 'Invalid user id', message ?? '');
}