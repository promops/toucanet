part of 'vk_exceptions.dart';

class VKApiWallLinksForbiddenException extends VKApiException {
  VKApiWallLinksForbiddenException([String message = ''])
      : super(222, 'Hyperlinks are forbidden', message);
}
