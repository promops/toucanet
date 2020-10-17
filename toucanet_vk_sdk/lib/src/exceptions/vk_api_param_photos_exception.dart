part of 'vk_exceptions.dart';

class VKApiParamPhotosException extends VKApiException {
  VKApiParamPhotosException([String message = ''])
      : super(122, 'Invalid photos', message);
}
