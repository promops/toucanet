part of 'vk_exceptions.dart';

class VKApiMessagesTooOldPtsException extends VKApiException {
  VKApiMessagesTooOldPtsException([String message = ''])
      : super(907, 'Value of ts or pts is too old', message);
}
