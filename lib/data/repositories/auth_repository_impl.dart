import 'package:toucanet_vk_sdk/toucanet_vk_sdk.dart';

import '../objects/account_object.dart';

import '../../domain/models/account_model.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/repositories/account_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final VKClient vkClient;
  final AccountRepository accountRepository;

  final scope = [
    'offline',
    'status',
    'groups',
    'photos',
    'friends',
    'messages'
  ];

  AuthRepositoryImpl(this.accountRepository, this.vkClient);

  @override
  bool get isAuth => accountRepository.current?.isAuth ?? false;

  @override
  String get authUrl => vkClient.auth.getAuthorizeUrl(scope: scope);

  @override
  AccountModel get current => accountRepository.current;

  @override
  Future<void> auth(AccountModel account) async {
    await accountRepository.update(account);
  }

  @override
  Future<void> browserAuth(String url) async {
    final data = vkClient.auth.parseAuthUrl(url);
    if (!data.containsKey('access_token')) throw Exception();

    try {
      final id = int.parse(data['user_id'] ?? '');
      final token = data['access_token'] ?? ''; // TODO: Exception empty_token
      final expiresIn = int.parse(data['expires_in'] ?? '');

      final account = AccountObject(id, token, expiresIn);
      await accountRepository.update(account.toModel());
    } on Exception catch (_) {
      throw Exception(); // TODO: Auth exception
    }
  }
}
