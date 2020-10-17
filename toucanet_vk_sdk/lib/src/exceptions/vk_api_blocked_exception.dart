part of 'vk_exceptions.dart';

class VKApiBlockedException extends VKApiException {
  VKApiBlockedException([String message = ''])
      : super(19, 'Content blocked', message);
}
