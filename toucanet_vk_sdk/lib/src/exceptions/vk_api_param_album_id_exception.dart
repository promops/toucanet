part of 'vk_exceptions.dart';

class VKApiParamAlbumIdException extends VKApiException {
  VKApiParamAlbumIdException([String message = ''])
      : super(114, 'Invalid album id', message);
}
