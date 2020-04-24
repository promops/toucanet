part of 'vk_api_exception.dart';

class VKApiPhotoChangedException extends VKApiException
{
  VKApiPhotoChangedException([String message]) :
    super(1160, 'Original photo was changed', message ?? '');
}