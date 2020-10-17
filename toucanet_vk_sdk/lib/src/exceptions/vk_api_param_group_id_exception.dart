part of 'vk_exceptions.dart';

class VKApiParamGroupIdException extends VKApiException {
  VKApiParamGroupIdException([String message = ''])
      : super(125, 'Invalid group id', message);
}
