import '../api/helpers/strings.dart';
import '../objects/account_object.dart';

import '../../domain/models/account_model.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/repositories/account_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AccountRepository accountRepository;

  AuthRepositoryImpl(this.accountRepository);

  @override
  bool get isAuth => accountRepository.current?.isAuth ?? false;

  @override
  AccountModel get current => accountRepository.current;

  @override
  Future<void> auth(AccountModel account) async {
    await accountRepository.update(account);
  }

  @override
  Future<void> browserAuth(String url) async {
    final data = _parseAuthUrl(url);
    if (!data.containsKey('access_token')) throw Exception();

    final account = AccountObject(int.parse(data['user_id']),
        data['access_token'], int.parse(data['expires_in']));

    await accountRepository.update(account.toModel());
  }

  Map<String, String> _parseAuthUrl(String uri) {
    final query = uri.substring(uri.indexOf('#') + 1);
    final parameters = VKStrings.explodeQuery(query);

    if (parameters.containsKey('error')) {
      throw Exception();
    }

    return parameters;
  }
}
