import 'vk_api_exception.dart';

class VKApiAccessNoteException extends VKApiException
{
  VKApiAccessNoteException([String message]) :
    super(181, 'Access to note denied', message ?? '');
}