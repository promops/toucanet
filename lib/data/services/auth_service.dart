import 'package:toucanet/core/config/config.dart';
import 'package:toucanet/data/models/account.dart';
import 'package:toucanet/data/services/exceptions/auth_exceptions.dart';

class AuthService
{
  String get v => Config.vk.api.version;
  String get scope => Config.vk.auth.permissions.join(',');
  String get clientId => Config.vk.auth.clientId.toString();
  String get oauthUrl => Config.vk.auth.oauthUrl + 'authorize';
  String get redirectUrl => Config.vk.auth.oauthUrl + 'blank.html';

  String get authUrl => 
    '$oauthUrl?client_id=$clientId&redirect_uri=$redirectUrl&scope=$scope&v=$v&response_type=token'; 

  AccountModel auth(String uri)
  {
    if (uri.indexOf('$redirectUrl#error=access_denied') == 0) 
    {
      throw AuthAccessDeniedException('User denied.');
    }
    
    if (uri.indexOf('$redirectUrl#access_token=') == 0)
    {
      final id = int.parse(uri.substring(uri.indexOf('&user_id=') + 9));
      final token = uri.substring('$redirectUrl#access_token='.length, uri.indexOf('&'));

      return AccountModel(id: id, token: token);
    }

    return null;
  }
}
