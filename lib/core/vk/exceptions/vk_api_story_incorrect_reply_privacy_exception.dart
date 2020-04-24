import 'vk_api_exception.dart';

class VKApiStoryIncorrectReplyPrivacyException extends VKApiException
{
  VKApiStoryIncorrectReplyPrivacyException([String message]) :
    super(1602, 'Incorrect reply privacy', message ?? '');
}