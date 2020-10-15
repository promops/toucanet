part of 'vk_api_exception.dart';

class VKApiNotFoundException extends VKApiException
{
  VKApiNotFoundException([String message]) :
    super(104, 'Not found', message ?? '');
}