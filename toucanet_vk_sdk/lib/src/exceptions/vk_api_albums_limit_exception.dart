part of 'vk_exceptions.dart';

class VKApiAlbumsLimitException extends VKApiException {
  VKApiAlbumsLimitException([String message = ''])
      : super(302, 'Albums number limit is reached', message);
}
