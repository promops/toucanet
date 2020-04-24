import 'vk_api_exception.dart';

class VKApiAccessVideoException extends VKApiException
{
  VKApiAccessVideoException([String message]) :
    super(204, 'Access denied', message ?? '');
}