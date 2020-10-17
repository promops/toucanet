part of 'vk_exceptions.dart';

class VKApiAccessGroupException extends VKApiException {
  VKApiAccessGroupException([String message = ''])
      : super(203, 'Access to group denied', message);
}
