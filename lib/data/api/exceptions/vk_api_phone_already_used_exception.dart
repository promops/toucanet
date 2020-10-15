part of 'vk_api_exception.dart';

class VKApiPhoneAlreadyUsedException extends VKApiException
{
  VKApiPhoneAlreadyUsedException([String message]) :
    super(1004, 'This phone number is used by another user', message ?? '');
}