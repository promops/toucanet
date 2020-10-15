import '../models/account_model.dart';

abstract class AccountRepository {
  AccountModel get current;

  Future<void> load();
  Future<void> remove();
  Future<void> update(AccountModel account);
}
