part of 'vk_api_exception.dart';

class VKApiParamAlbumIdException extends VKApiException
{
  VKApiParamAlbumIdException([String message]) :
    super(114, 'Invalid album id', message ?? '');
}