import 'vk_api_exception.dart';

class VKApiVotesException extends VKApiException
{
  VKApiVotesException([String message]) :
    super(503, 'Not enough votes', message ?? '');
}