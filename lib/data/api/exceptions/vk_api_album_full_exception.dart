part of 'vk_api_exception.dart';

class VKApiAlbumFullException extends VKApiException
{
  VKApiAlbumFullException([String message]) :
    super(300, 'This album is full', message ?? '');
}