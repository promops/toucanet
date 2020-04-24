import 'vk_api_exception.dart';

class VKApiAccessNoteCommentException extends VKApiException
{
  VKApiAccessNoteCommentException([String message]) :
    super(182, 'You can\'t comment this note', message ?? '');
}