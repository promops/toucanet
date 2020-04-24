part of 'vk_api_exception.dart';

class VKApiMarketTooManyItemsInAlbumException extends VKApiException
{
  VKApiMarketTooManyItemsInAlbumException([String message]) :
    super(1406, 'Too many items in album', message ?? '');
}