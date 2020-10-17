part of 'vk_exceptions.dart';

class VKApiGroupTooManyOfficersException extends VKApiException {
  VKApiGroupTooManyOfficersException([String message = ''])
      : super(702, 'Too many officers in club', message);
}
