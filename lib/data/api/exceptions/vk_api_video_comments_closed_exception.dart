part of 'vk_api_exception.dart';

class VKApiVideoCommentsClosedException extends VKApiException
{
  VKApiVideoCommentsClosedException([String message]) :
    super(801, 'Comments for this video are closed', message ?? '');
}