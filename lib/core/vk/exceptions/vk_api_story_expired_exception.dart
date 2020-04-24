part of 'vk_api_exception.dart';

class VKApiStoryExpiredException extends VKApiException
{
  VKApiStoryExpiredException([String message]) :
    super(1600, 'Story has already expired', message ?? '');
}