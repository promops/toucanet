part of 'vk_api_exception.dart';

class VKApiAuthValidationException extends VKApiException
{
  VKApiAuthValidationException([String message]) :
    super(17, 'Validation required', message ?? '');
}