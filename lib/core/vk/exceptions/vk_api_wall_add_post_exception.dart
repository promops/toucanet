import 'vk_api_exception.dart';

class VKApiWallAddPostException extends VKApiException
{
  VKApiWallAddPostException([String message]) :
    super(214, 'Access to adding post denied', message ?? '');
}