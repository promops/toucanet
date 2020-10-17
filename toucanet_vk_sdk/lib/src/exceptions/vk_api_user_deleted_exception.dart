part of 'vk_exceptions.dart';

class VKApiUserDeletedException extends VKApiException {
  VKApiUserDeletedException([String message = ''])
      : super(18, 'User was deleted or banned', message);
}
