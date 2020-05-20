import './../objects/account.dart';
import './../remotes/vk_auth_remote.dart';
import './../repositories/accounts_repository.dart';

class AuthService
{
  Function(String) onAuth;

  final VKAuthRemote authRemote;
  final AccountsRepository accountRepository;

  AuthService(this.accountRepository) : this.authRemote = VKAuthRemote();

  bool get isAuth=> 
    (this.current?.isValid ?? false) &&
    (this.current?.token?.isNotEmpty ?? false);

  String get authUrl => this.authRemote.authUrl;

  AccountModel get current => this.accountRepository.current;
  List<AccountModel> get accounts => this.accountRepository.all;

  Future<void> auth(AccountModel account) async {
    await this.accountRepository.addOrUpdate(account);
  }

  Future<void> browserAuth(String url) async {
    final account = authRemote.parseAuthUrl(url);

    await this.auth(account);
    this.onAuth(account.token);
  }
}
