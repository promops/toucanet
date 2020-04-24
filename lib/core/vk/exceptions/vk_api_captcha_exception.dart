import 'vk_api_exception.dart';

class VKApiCaptchaException extends VKApiException
{
  VKApiCaptchaException([String message]) :
    super(14, 'Captcha needed', message ?? '');
}