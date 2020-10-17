part of 'vk_exceptions.dart';

class VKApiParamPhotoException extends VKApiException {
  VKApiParamPhotoException([String message = ''])
      : super(129, 'Invalid photo', message);
}
