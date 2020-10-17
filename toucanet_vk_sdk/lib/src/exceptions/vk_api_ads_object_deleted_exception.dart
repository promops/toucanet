part of 'vk_exceptions.dart';

class VKApiAdsObjectDeletedException extends VKApiException {
  VKApiAdsObjectDeletedException([String message = ''])
      : super(629, 'Object deleted', message);
}
