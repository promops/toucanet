part of 'vk_api_exception.dart';

class VKApiAccessMenuException extends VKApiException
{
  VKApiAccessMenuException([String message]) :
    super(148, 'Access to the menu of the user denied', message ?? '');
}