part of 'vk_exceptions.dart';

class VKApiMarketAlbumNotFoundException extends VKApiException {
  VKApiMarketAlbumNotFoundException([String message = ''])
      : super(1402, 'Album not found', message);
}
