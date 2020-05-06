import '../objects/account.dart';
import '../repositories/accounts_repository.dart';

class AccountService {
  final AccountsRepository accountRepository = AccountsRepository();

  bool get hasAccount => accountRepository.current?.token?.isNotEmpty ?? false;

  Future<void> addAccount(AccountModel account) async =>
      await accountRepository.addOrUpdate(account);
}
