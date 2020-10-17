part of 'vk_exceptions.dart';

class VKApiWallReplyOwnerFloodException extends VKApiException {
  VKApiWallReplyOwnerFloodException([String message = ''])
      : super(223, 'Too many replies', message);
}
