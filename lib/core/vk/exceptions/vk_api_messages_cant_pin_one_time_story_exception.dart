import 'vk_api_exception.dart';

class VKApiMessagesCantPinOneTimeStoryException extends VKApiException
{
  VKApiMessagesCantPinOneTimeStoryException([String message]) :
    super(942, 'Cannot pin one-time story', message ?? '');
}