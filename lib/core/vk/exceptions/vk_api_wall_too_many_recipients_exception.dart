import 'vk_api_exception.dart';

class VKApiWallTooManyRecipientsException extends VKApiException
{
  VKApiWallTooManyRecipientsException([String message]) :
    super(220, 'Too many recipients', message ?? '');
}