part of 'vk_exceptions.dart';

class VKApiParamDocTitleException extends VKApiException {
  VKApiParamDocTitleException([String message = ''])
      : super(1152, 'Invalid document title', message);
}
