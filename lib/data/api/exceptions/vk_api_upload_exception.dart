part of 'vk_api_exception.dart';

class VKApiUploadException extends VKApiException
{
  VKApiUploadException([String message]) :
    super(22, 'Upload error', message ?? '');
}