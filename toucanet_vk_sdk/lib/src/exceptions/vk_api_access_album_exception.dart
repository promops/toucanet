part of 'vk_exceptions.dart';

class VKApiAccessAlbumException extends VKApiException {
  VKApiAccessAlbumException([String message = ''])
      : super(200, 'Access denied', message);
}
