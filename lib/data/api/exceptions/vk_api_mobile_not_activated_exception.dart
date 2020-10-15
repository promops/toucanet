part of 'vk_api_exception.dart';

class VKApiMobileNotActivatedException extends VKApiException
{
  VKApiMobileNotActivatedException([String message]) :
    super(146, 'The mobile number of the user is unknown', message ?? '');
}