import 'vk_api_exception.dart';

class VKApiUserDeletedException extends VKApiException
{
  VKApiUserDeletedException([String message]) :
    super(18, 'User was deleted or banned', message ?? '');
}