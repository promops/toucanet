import 'package:toucanet/data/models/account.dart';
import 'package:toucanet/data/repositories/account_repository.dart';

class AccountService
{
  final AccountRepository accountRepository = AccountRepository();

  bool get hasAccount => 
    accountRepository.current?.token?.isNotEmpty ?? false;  

  Future<void> addAccount(AccountModel account) async => 
    await accountRepository.add(account);
}
