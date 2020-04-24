import 'vk_api_exception.dart';

class VKApiParamDocIdException extends VKApiException
{
  VKApiParamDocIdException([String message]) :
    super(1150, 'Invalid document id', message ?? '');
}