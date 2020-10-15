part of 'vk_api_exception.dart';

class VKApiAlbumsLimitException extends VKApiException
{
  VKApiAlbumsLimitException([String message]) :
    super(302, 'Albums number limit is reached', message ?? '');
}