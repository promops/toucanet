part of 'vk_exceptions.dart';

class VKApiStoryExpiredException extends VKApiException {
  VKApiStoryExpiredException([String message = ''])
      : super(1600, 'Story has already expired', message);
}
