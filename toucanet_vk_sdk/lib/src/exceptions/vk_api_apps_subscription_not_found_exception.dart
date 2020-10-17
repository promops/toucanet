part of 'vk_exceptions.dart';

class VKApiAppsSubscriptionNotFoundException extends VKApiException {
  VKApiAppsSubscriptionNotFoundException([String message = ''])
      : super(1256, 'Subscription not found', message);
}
