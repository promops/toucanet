import 'vk_api_exception.dart';

class VKApiPollsAccessWithoutVoteException extends VKApiException
{
  VKApiPollsAccessWithoutVoteException([String message]) :
    super(253, 'Access denied, please vote first', message ?? '');
}