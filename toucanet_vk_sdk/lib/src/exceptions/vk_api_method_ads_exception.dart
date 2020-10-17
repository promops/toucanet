part of 'vk_exceptions.dart';

class VKApiMethodAdsException extends VKApiException {
  VKApiMethodAdsException([String message = ''])
      : super(
            21,
            'Permission to perform this action is allowed only for standalone and OpenAPI applications',
            message);
}
