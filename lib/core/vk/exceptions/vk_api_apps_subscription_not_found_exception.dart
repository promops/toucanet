import 'vk_api_exception.dart';

class VKApiAppsSubscriptionNotFoundException extends VKApiException
{
  VKApiAppsSubscriptionNotFoundException([String message]) :
    super(1256, 'Subscription not found', message ?? '');
}