part of 'vk_exceptions.dart';

class VKApiVideoCommentsClosedException extends VKApiException {
  VKApiVideoCommentsClosedException([String message = ''])
      : super(801, 'Comments for this video are closed', message);
}
