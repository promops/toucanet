part of 'vk_api_exception.dart';

class VKApiPrivateProfileException extends VKApiException
{
  VKApiPrivateProfileException([String message]) :
    super(30, 'This profile is private', message ?? '');
}