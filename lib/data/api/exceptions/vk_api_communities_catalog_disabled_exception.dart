part of 'vk_api_exception.dart';

class VKApiCommunitiesCatalogDisabledException extends VKApiException
{
  VKApiCommunitiesCatalogDisabledException([String message]) :
    super(1310, 'Catalog is not available for this user', message ?? '');
}