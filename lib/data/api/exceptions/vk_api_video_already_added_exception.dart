part of 'vk_api_exception.dart';

class VKApiVideoAlreadyAddedException extends VKApiException
{
  VKApiVideoAlreadyAddedException([String message]) :
    super(800, 'This video is already added', message ?? '');
}