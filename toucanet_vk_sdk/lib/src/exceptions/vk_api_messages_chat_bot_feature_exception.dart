part of 'vk_exceptions.dart';

class VKApiMessagesChatBotFeatureException extends VKApiException {
  VKApiMessagesChatBotFeatureException([String message = ''])
      : super(912, 'This is a chat bot feature, change this status in settings',
            message);
}
