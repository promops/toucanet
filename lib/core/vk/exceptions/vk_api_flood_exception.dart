import 'vk_api_exception.dart';

class VKApiFloodException extends VKApiException
{
  VKApiFloodException([String message]) :
    super(9, 'Flood control', message ?? '');
}