part of 'vk_exceptions.dart';

class VKApiAlbumFullException extends VKApiException {
  VKApiAlbumFullException([String message = ''])
      : super(300, 'This album is full', message);
}
