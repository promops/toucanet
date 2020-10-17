part of 'vk_exceptions.dart';

class VKApiMarketTooManyItemsInAlbumException extends VKApiException {
  VKApiMarketTooManyItemsInAlbumException([String message = ''])
      : super(1406, 'Too many items in album', message);
}
