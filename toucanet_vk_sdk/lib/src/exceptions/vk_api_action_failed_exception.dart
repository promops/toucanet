part of 'vk_exceptions.dart';

class VKApiActionFailedException extends VKApiException {
  VKApiActionFailedException([String message = ''])
      : super(106, 'Unable to process action', message);
}
