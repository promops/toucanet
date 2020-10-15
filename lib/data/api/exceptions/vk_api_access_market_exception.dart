part of 'vk_api_exception.dart';

class VKApiAccessMarketException extends VKApiException
{
  VKApiAccessMarketException([String message]) :
    super(205, 'Access denied', message ?? '');
}