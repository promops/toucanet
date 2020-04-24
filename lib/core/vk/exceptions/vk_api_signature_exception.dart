part of 'vk_api_exception.dart';

class VKApiSignatureException extends VKApiException
{
  VKApiSignatureException([String message]) :
    super(4, 'Incorrect signature', message ?? '');
}