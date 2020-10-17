part of 'vk_exceptions.dart';

class VKApiParamTitleException extends VKApiException {
  VKApiParamTitleException([String message = ''])
      : super(119, 'Invalid title', message);
}
