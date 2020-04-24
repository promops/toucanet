import 'vk_api_exception.dart';

class VKApiParamPhotosException extends VKApiException
{
  VKApiParamPhotosException([String message]) :
    super(122, 'Invalid photos', message ?? '');
}