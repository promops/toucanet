part of 'vk_api_exception.dart';

class VKApiGroupNeed2faException extends VKApiException
{
  VKApiGroupNeed2faException([String message]) :
    super(703, 'You need to enable 2FA for this action', message ?? '');
}