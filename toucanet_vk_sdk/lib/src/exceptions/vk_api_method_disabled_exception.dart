part of 'vk_exceptions.dart';

class VKApiMethodDisabledException extends VKApiException {
  VKApiMethodDisabledException([String message = ''])
      : super(23, 'This method was disabled', message);
}
