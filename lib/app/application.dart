import 'package:isolate_supervisor/isolate_supervisor.dart';

import 'package:toucanet/core/vk/vk.dart';
import 'package:toucanet/core/config.dart';

import 'package:toucanet/data/services/auth_service.dart';
import 'package:toucanet/data/remotes/vk_users_remote.dart';
import 'package:toucanet/data/services/messages_service.dart';
import 'package:toucanet/data/remotes/vk_messages_remote.dart';
import 'package:toucanet/data/repositories/accounts_repository.dart';

part 'application_options.dart';

class Application
{
  VK vk;
  IsolateSupervisor _supervisor;

  AuthService authService;
  MessagesService messagesService; 
  
  // TODO: Убрать лишнее
  VKUsersRemote usersRemote;
  VKMessagesRemote messagesRemote;

  final ApplicationOptions options;
  final AccountsRepository accountsRepository;

  static bool get isProduction => bool.fromEnvironment('dart.vm.product');

  Application() : 
    options = ApplicationOptions(),
    accountsRepository = AccountsRepository();

  Future start() async 
  {
    this._supervisor = IsolateSupervisor.spawn(
      lazily: true,
      count: options.numberOfWorkers
    );

    await accountsRepository.init();
    await Config().load(options.configurationFiles);

    this.vk = VK(this._supervisor);

    this.authService = AuthService(this.vk, accountsRepository);
    this.authService.onAuth = (token) => this.vk.init(token);

    this.usersRemote = VKUsersRemote(vk);
    this.messagesRemote = VKMessagesRemote(vk);
    
    this.messagesService = MessagesService(this.messagesRemote);
  }

  Future stop() async 
  {
    await this._supervisor?.dispose();
  }
}
