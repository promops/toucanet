part of 'vk_api_exception.dart';

class VKApiActionFailedException extends VKApiException
{
  VKApiActionFailedException([String message]) :
    super(106, 'Unable to process action', message ?? '');
}