part of 'vk_api_exception.dart';

class VKApiAccessGroupsException extends VKApiException {
  VKApiAccessGroupsException([String message])
      : super(
          260,
          "Access to the groups list is denied due to the user's privacy settings",
          message ?? '',
        );
}
