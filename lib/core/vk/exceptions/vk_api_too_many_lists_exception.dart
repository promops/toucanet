import 'vk_api_exception.dart';

class VKApiTooManyListsException extends VKApiException
{
  VKApiTooManyListsException([String message]) :
    super(1170, 'Too many feed lists', message ?? '');
}