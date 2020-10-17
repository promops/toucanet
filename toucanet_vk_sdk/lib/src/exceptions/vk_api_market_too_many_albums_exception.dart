part of 'vk_exceptions.dart';

class VKApiMarketTooManyAlbumsException extends VKApiException {
  VKApiMarketTooManyAlbumsException([String message = ''])
      : super(1407, 'Too many albums', message);
}
