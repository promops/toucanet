part of 'vk_api_exception.dart';

class VKApiMessagesTooManyPostsException extends VKApiException
{
  VKApiMessagesTooManyPostsException([String message]) :
    super(940, 'Too many posts in messages', message ?? '');
}