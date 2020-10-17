part of 'vk_exceptions.dart';

class VKApiAccessNoteException extends VKApiException {
  VKApiAccessNoteException([String message = ''])
      : super(181, 'Access to note denied', message);
}
