part of 'vk_exceptions.dart';

class VKApiVideoAlreadyAddedException extends VKApiException {
  VKApiVideoAlreadyAddedException([String message = ''])
      : super(800, 'This video is already added', message);
}
