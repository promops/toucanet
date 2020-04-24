part of 'vk_api_exception.dart';

class VKApiParamNoteIdException extends VKApiException
{
  VKApiParamNoteIdException([String message]) :
    super(180, 'Note not found', message ?? '');
}