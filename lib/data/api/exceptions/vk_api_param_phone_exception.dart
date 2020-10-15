part of 'vk_api_exception.dart';

class VKApiParamPhoneException extends VKApiException
{
  VKApiParamPhoneException([String message]) :
    super(1000, 'Invalid phone number', message ?? '');
}