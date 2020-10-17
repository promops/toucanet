part of 'vk_exceptions.dart';

class VKApiMessagesTooNewPtsException extends VKApiException {
  VKApiMessagesTooNewPtsException([String message = ''])
      : super(908, 'Value of ts or pts is too new', message);
}
