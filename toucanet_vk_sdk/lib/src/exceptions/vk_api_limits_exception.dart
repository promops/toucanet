part of 'vk_exceptions.dart';

class VKApiLimitsException extends VKApiException {
  VKApiLimitsException([String message = ''])
      : super(103, 'Out of limits', message);
}
