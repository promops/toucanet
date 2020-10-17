part of 'vk_exceptions.dart';

class VKApiUploadException extends VKApiException {
  VKApiUploadException([String message = ''])
      : super(22, 'Upload error', message);
}
