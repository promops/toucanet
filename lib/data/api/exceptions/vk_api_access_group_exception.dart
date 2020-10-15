part of 'vk_api_exception.dart';

class VKApiAccessGroupException extends VKApiException
{
  VKApiAccessGroupException([String message]) :
    super(203, 'Access to group denied', message ?? '');
}