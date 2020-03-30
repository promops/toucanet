import 'dart:convert';

import 'package:toucanet/data/models/account.dart';
import 'package:flutter_keychain/flutter_keychain.dart';

class AccountsRepository
{
  static const _keychain = 'accounts';
  static final AccountsRepository _instance = new AccountsRepository._();

  AccountModel _currentAccount;
  List<AccountModel> _allAccounts = [];

  List<AccountModel> get all => this._allAccounts;
  AccountModel get current => this._currentAccount;

  AccountsRepository._();
  factory AccountsRepository() => _instance;

  Future<void> init() async
  {
    try {
      String jsonString = await FlutterKeychain.get(key: AccountsRepository._keychain);
      List<dynamic> accounts = json.decode(jsonString ?? '[]');

      if (accounts is! List) return;

      this._allAccounts = accounts.map((a) => AccountModel.fromJson(a)).toList();
      if (this._allAccounts.isNotEmpty) this._currentAccount = this._allAccounts[0];
    }
    catch (_) {}
  }

  Future<void> clearAll() async
  {
    this._allAccounts = [];
    this._currentAccount = null;

    await this._updateStorage();
  }

  Future<void> addOrUpdate(AccountModel account) async 
  {
    try {
      this._allAccounts.firstWhere((a) => a.id == account.id)
        ..token = account.token
        ..created = account.created
        ..expiresIn = account.expiresIn;
    }
    catch (_) 
    {
      this._currentAccount = AccountModel.clone(account); 
      this._allAccounts.add(this._currentAccount);
    }

    await this._updateStorage();
  }

  Future<void> remove(AccountModel account) async 
  {
    if (this._currentAccount.token == account.token) {
      this._currentAccount = null;
    }
    
    this._allAccounts.removeWhere((a) => a.id == account.id);

    await this._updateStorage();
  }

  Future<void> _updateStorage() async
  {
    try {
      await FlutterKeychain.put(
        key: AccountsRepository._keychain, 
        value: json.encode(this._allAccounts.map((a) => a.toJson()).toList())
      );
    }
    catch (_) {}
  }
}
