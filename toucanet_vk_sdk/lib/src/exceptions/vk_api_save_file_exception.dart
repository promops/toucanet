part of 'vk_exceptions.dart';

class VKApiSaveFileException extends VKApiException {
  VKApiSaveFileException([String message = ''])
      : super(105, "Couldn't save file", message);
}
