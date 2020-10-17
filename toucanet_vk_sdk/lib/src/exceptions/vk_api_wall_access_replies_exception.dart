part of 'vk_exceptions.dart';

class VKApiWallAccessRepliesException extends VKApiException {
  VKApiWallAccessRepliesException([String message = ''])
      : super(212, 'Access to post comments denied', message);
}
