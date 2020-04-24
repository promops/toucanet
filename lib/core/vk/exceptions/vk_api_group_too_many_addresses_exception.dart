import 'vk_api_exception.dart';

class VKApiGroupTooManyAddressesException extends VKApiException
{
  VKApiGroupTooManyAddressesException([String message]) :
    super(706, 'Too many addresses in club', message ?? '');
}