import 'vk_api_exception.dart';

class VKApiWallAccessAddReplyException extends VKApiException
{
  VKApiWallAccessAddReplyException([String message]) :
    super(213, 'Access to status replies denied', message ?? '');
}