import '../models/account_model.dart';

abstract class AuthRepository {
  bool get isAuth;
  AccountModel get current;

  Future<void> auth(AccountModel account);
  Future<void> browserAuth(String url);
}
