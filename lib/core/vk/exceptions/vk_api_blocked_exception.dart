part of 'vk_api_exception.dart';

class VKApiBlockedException extends VKApiException
{
  VKApiBlockedException([String message]) :
    super(19, 'Content blocked', message ?? '');
}