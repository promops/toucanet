part of 'vk_api_exception.dart';

class VKApiParamDocTitleException extends VKApiException
{
  VKApiParamDocTitleException([String message]) :
    super(1152, 'Invalid document title', message ?? '');
}