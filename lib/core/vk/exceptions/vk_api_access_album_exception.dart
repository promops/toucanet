import 'vk_api_exception.dart';

class VKApiAccessAlbumException extends VKApiException
{
  VKApiAccessAlbumException([String message]) :
    super(200, 'Access denied', message ?? '');
}