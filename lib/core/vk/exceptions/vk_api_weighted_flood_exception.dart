part of 'vk_api_exception.dart';

class VKApiWeightedFloodException extends VKApiException
{
  VKApiWeightedFloodException([String message]) :
    super(601, 'Permission denied. You have requested too many actions this day. Try later.', message ?? '');
}