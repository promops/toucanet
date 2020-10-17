part of 'vk_exceptions.dart';

class VKApiAccessPageException extends VKApiException {
  VKApiAccessPageException([String message = ''])
      : super(141, 'Access to page denied', message);
}
