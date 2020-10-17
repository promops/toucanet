part of 'vk_exceptions.dart';

class VKApiMessagesCantPinOneTimeStoryException extends VKApiException {
  VKApiMessagesCantPinOneTimeStoryException([String message = ''])
      : super(942, 'Cannot pin one-time story', message);
}
