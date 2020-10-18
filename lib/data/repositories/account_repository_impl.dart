import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../helpers/json.dart';
import '../objects/account_object.dart';

import '../../domain/models/account_model.dart';
import '../../domain/repositories/account_repository.dart';
import '../../domain/repositories/exceptions/account_exceptions.dart';

class AccountRepositoryImpl implements AccountRepository {
  static const _keychain = 'account';
  static const _storage = FlutterSecureStorage();

  AccountObject _currentAccount;

  @override
  AccountModel get current => _currentAccount?.toModel();

  @override
  Future<void> load() async {
    if (!await _storage.containsKey(key: _keychain)) {
      throw AccountException('Account not found.');
    }

    try {
      _currentAccount = Json.decode(
        await _storage.read(key: _keychain),
        (dynamic json) => AccountObject.fromJson(json as Map<String, dynamic>),
      );
    } on Exception catch (_) {
      throw AccountException('Account data is corrupted.');
    }
  }

  @override
  Future<void> remove() => _storage.delete(key: _keychain);

  @override
  Future<void> update(AccountModel account) async {
    try {
      final value = Json.encode(AccountObject.fromModel(account));
      await _storage.write(key: _keychain, value: value);
    } on Exception catch (_) {
      throw AccountException('Unable to write account data to storage.');
    }
  }
}
