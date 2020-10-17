part of 'vk_exceptions.dart';

class VKApiAccessMarketException extends VKApiException {
  VKApiAccessMarketException([String message = ''])
      : super(205, 'Access denied', message);
}
