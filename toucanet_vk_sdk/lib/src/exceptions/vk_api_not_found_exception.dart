part of 'vk_exceptions.dart';

class VKApiNotFoundException extends VKApiException {
  VKApiNotFoundException([String message = ''])
      : super(104, 'Not found', message);
}
