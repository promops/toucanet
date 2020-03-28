import 'package:flutter_keychain/flutter_keychain.dart';

import 'package:toucanet/data/models/account.dart';

class AccountRepository
{
  AccountModel _currentAccount = AccountModel();
  static const _keychain = 'account';

  bool get isAuth => 
    this._currentAccount.token?.isNotEmpty ?? false;

  Future<void> signIn(String token) async 
  {
    await FlutterKeychain.put(key: _keychain, value: token ?? '');
    this._currentAccount.token = token;
  }

  Future<void> signOut() async
  {
    this._currentAccount.token = null;
    await FlutterKeychain.remove(key: AccountRepository._keychain);
  }
}
