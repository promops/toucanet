import '../objects/account.dart';
import '../remotes/vk_auth_remote.dart';

class AuthService
{
  VKAuthRemote _vkAuthRemote = VKAuthRemote();

  String get authUrl => _vkAuthRemote.authUrl;
  
  bool isAuth(AccountModel account) => !account.isValid;
  AccountModel browserAuth(String url) => _vkAuthRemote.parseAuthUrl(url);
}
