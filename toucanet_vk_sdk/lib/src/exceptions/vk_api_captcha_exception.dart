part of 'vk_exceptions.dart';

class VKApiCaptchaException extends VKApiException {
  VKApiCaptchaException([String message = ''])
      : super(14, 'Captcha needed', message);
}
