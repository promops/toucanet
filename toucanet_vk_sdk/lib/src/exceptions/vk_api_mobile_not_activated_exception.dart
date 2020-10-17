part of 'vk_exceptions.dart';

class VKApiMobileNotActivatedException extends VKApiException {
  VKApiMobileNotActivatedException([String message = ''])
      : super(146, 'The mobile number of the user is unknown', message);
}
