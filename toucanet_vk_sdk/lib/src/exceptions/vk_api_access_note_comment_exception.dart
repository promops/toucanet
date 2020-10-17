part of 'vk_exceptions.dart';

class VKApiAccessNoteCommentException extends VKApiException {
  VKApiAccessNoteCommentException([String message = ''])
      : super(182, "You can't comment this note", message);
}
