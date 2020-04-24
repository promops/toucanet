import 'vk_api_exception.dart';

class VKApiParamPhotoException extends VKApiException
{
  VKApiParamPhotoException([String message]) :
    super(129, 'Invalid photo', message ?? '');
}