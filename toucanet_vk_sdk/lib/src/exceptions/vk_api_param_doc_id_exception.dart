part of 'vk_exceptions.dart';

class VKApiParamDocIdException extends VKApiException {
  VKApiParamDocIdException([String message = ''])
      : super(1150, 'Invalid document id', message);
}
