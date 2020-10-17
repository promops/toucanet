part of 'vk_exceptions.dart';

class VKApiWallAccessCommentException extends VKApiException {
  VKApiWallAccessCommentException([String message = ''])
      : super(211, "Access to wall's comment denied", message);
}
