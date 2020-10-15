part of 'vk_api_exception.dart';

class VKApiGroupAppIsNotInstalledInCommunityException extends VKApiException
{
  VKApiGroupAppIsNotInstalledInCommunityException([String message]) :
    super(711, 'Application is not installed in community', message ?? '');
}