part of 'vk_exceptions.dart';

class VKApiParamNoteIdException extends VKApiException {
  VKApiParamNoteIdException([String message = ''])
      : super(180, 'Note not found', message);
}
