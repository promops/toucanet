import 'package:toucanet/core/vk/vk.dart';

import './../objects/account.dart';
import './../repositories/accounts_repository.dart';

class AuthService
{
  Function(String) onAuth;

  final VK vk;
  final AccountsRepository accountRepository;

  AuthService(this.vk, this.accountRepository);

  bool get isAuth=> 
    (this.current?.isValid ?? false) &&
    (this.current?.token?.isNotEmpty ?? false);

  String get authUrl => this.vk.auth.oAuthUrl;

  AccountModel get current => this.accountRepository.current;
  List<AccountModel> get accounts => this.accountRepository.all;

  Future<void> auth(AccountModel account) async {
    await this.accountRepository.addOrUpdate(account);
  }

  Future<void> browserAuth(String url) async {
    final data = this.vk.auth.parseAuthUrl(url);
    if (!data.containsKey('access_token')) return;

    final account = AccountModel(
      int.parse(data['user_id']), 
      data['access_token'],
      int.parse(data['expires_in'])
    );

    await this.auth(account);
    this.onAuth(account.token);
  }
}
