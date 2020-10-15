part of 'vk_api_exception.dart';

class VKApiMessagesCantFwdException extends VKApiException {
  VKApiMessagesCantFwdException([String message])
      : super(921, "Can't forward these messages", message ?? '');
}
