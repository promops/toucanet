part of 'vk_api_exception.dart';

class VKApiWallAccessPostException extends VKApiException
{
  VKApiWallAccessPostException([String message]) :
    super(210, 'Access to wall\'s post denied', message ?? '');
}