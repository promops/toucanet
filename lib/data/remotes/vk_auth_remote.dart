
import 'package:toucanet/core/config.dart';
import 'package:toucanet/core/http/http_utils.dart';

import 'package:toucanet/data/objects/account.dart';
import 'package:toucanet/data/remotes/exceptions/vk_exception.dart';

class VKAuthRemote
{
  String version = Config.get(['vk', 'api', 'version'], '5.103');
  final int clientId = Config.get(['vk', 'auth', 'clientId']);
  final String oauthUrl = Config.get(['vk', 'auth', 'oauthUrl']) + 'authorize';
  final String redirectUrl = Config.get(['vk', 'auth', 'oauthUrl']) + 'blank.html';
  final String permissions = Config.get<List>(['vk', 'auth', 'permissions']).join(',');

  String get authUrl =>
    '$oauthUrl?client_id=$clientId&redirect_uri=$redirectUrl&scope=$permissions&v=$version&response_type=token';

 AccountModel parseAuthUrl(String uri)
  {
    final queryString = uri.substring(uri.indexOf("#") + 1);
    final parameters = HttpUtils.explodeQueryString(queryString);

    if (parameters.containsKey('error')) {
      throw VKAuthAccessDeniedException('User denied.');
    }
    
    if (parameters.containsKey('access_token')) {
      return AccountModel(
        int.parse(parameters['user_id']), 
        parameters['access_token'],
        int.parse(parameters['expires_in'])
      );
    }

    throw VKAuthAccessDeniedException('');
  }
}