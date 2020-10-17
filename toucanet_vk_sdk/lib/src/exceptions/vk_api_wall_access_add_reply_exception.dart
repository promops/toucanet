part of 'vk_exceptions.dart';

class VKApiWallAccessAddReplyException extends VKApiException {
  VKApiWallAccessAddReplyException([String message = ''])
      : super(213, 'Access to status replies denied', message);
}
