part of 'vk_api_exception.dart';

class VKApiCommunitiesCategoriesDisabledException extends VKApiException
{
  VKApiCommunitiesCategoriesDisabledException([String message]) :
    super(1311, 'Catalog categories are not available for this user', message ?? '');
}