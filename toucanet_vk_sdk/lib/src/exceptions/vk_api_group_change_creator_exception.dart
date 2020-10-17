part of 'vk_exceptions.dart';

class VKApiGroupChangeCreatorException extends VKApiException {
  VKApiGroupChangeCreatorException([String message = ''])
      : super(700, 'Cannot edit creator role', message);
}
