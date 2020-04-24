part of 'vk_api_exception.dart';

class VKApiWallLinksForbiddenException extends VKApiException
{
  VKApiWallLinksForbiddenException([String message]) :
    super(222, 'Hyperlinks are forbidden', message ?? '');
}