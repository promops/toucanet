part of 'vk_exceptions.dart';

class VKApiAccessCommentException extends VKApiException {
  VKApiAccessCommentException([String message = ''])
      : super(183, 'Access to comment denied', message);
}
