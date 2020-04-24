import 'vk_api_exception.dart';

class VKApiMessagesCantDeleteForAllException extends VKApiException
{
  VKApiMessagesCantDeleteForAllException([String message]) :
    super(924, 'Can\'t delete this message for everybody', message ?? '');
}