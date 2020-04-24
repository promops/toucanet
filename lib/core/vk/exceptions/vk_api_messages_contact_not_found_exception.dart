part of 'vk_api_exception.dart';

class VKApiMessagesContactNotFoundException extends VKApiException
{
  VKApiMessagesContactNotFoundException([String message]) :
    super(936, 'Contact not found', message ?? '');
}