import 'package:isolate_supervisor/isolate_supervisor.dart';

import 'package:toucanet/core/config.dart';
import 'package:toucanet/core/vk/vk_api.dart';
import 'package:toucanet/data/repositories/accounts_repository.dart';

part 'application_options.dart';

class Application
{
  VKApi _vkApi;
  IsolateSupervisor _supervisor;

  final ApplicationOptions options;
  final AccountsRepository accountsRepository;

  VKApi get vkApi => this._vkApi;
  static bool get isProduction => bool.fromEnvironment('dart.vm.product');

  // TODO: Для теста, потом исправтьб
  static final _instance = Application._internal();
  factory Application() => _instance;

  Application._internal() : 
    options = ApplicationOptions(),
    accountsRepository = AccountsRepository();

  Future start() async 
  {
    this._supervisor = IsolateSupervisor.spawn(
      lazily: true,
      count: options.numberOfWorkers
    );

    await AccountsRepository().init();
    await Config().load(options.configurationFiles);

    this._vkApi = VKApi(AccountsRepository().current.token, this._supervisor);
    this._vkApi.longpoll.launch();
  }

  Future stop() async 
  {
    await this._supervisor?.dispose();
  }
}
