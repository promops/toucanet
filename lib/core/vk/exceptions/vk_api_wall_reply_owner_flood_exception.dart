part of 'vk_api_exception.dart';

class VKApiWallReplyOwnerFloodException extends VKApiException
{
  VKApiWallReplyOwnerFloodException([String message]) :
    super(223, 'Too many replies', message ?? '');
}