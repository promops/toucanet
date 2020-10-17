part of 'vk_exceptions.dart';

class VKApiDisabledException extends VKApiException {
  VKApiDisabledException([String message = ''])
      : super(
            2,
            'Application is disabled. Enable your application or use test mode',
            message);
}
