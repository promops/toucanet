import 'vk_api_exception.dart';

class VKApiAppsSubscriptionInvalidStatusException extends VKApiException
{
  VKApiAppsSubscriptionInvalidStatusException([String message]) :
    super(1257, 'Subscription is in invalid status', message ?? '');
}