import 'vk_api_exception.dart';

class VKApiAccessPageException extends VKApiException
{
  VKApiAccessPageException([String message]) :
    super(141, 'Access to page denied', message ?? '');
}