part of 'vk_exceptions.dart';

class VKApiMarketCommentsClosedException extends VKApiException {
  VKApiMarketCommentsClosedException([String message = ''])
      : super(1401, 'Comments for this market are closed', message);
}
