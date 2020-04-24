import 'vk_api_exception.dart';

class VKApiInsufficientFundsException extends VKApiException
{
  VKApiInsufficientFundsException([String message]) :
    super(147, 'Application has insufficient funds', message ?? '');
}