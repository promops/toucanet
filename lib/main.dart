import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/app.dart';
import 'app/injector.dart';
import 'core/config/config.dart';
import 'core/helper/push_manager.dart';
import 'data/repositories/accounts_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Config.load();
  await AccountsRepository().init();

  await PushManager().init();

  //AuthService().isAuth(AccountsRepository().current);
  //await AccountsRepository().clearAll();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  //VKUsersRemote(AccountsRepository().current.token).getUser();

  //VKMessagesRemote(AccountsRepository().current.token).getById([552885]);

  //await VKLongpullRemote(AccountsRepository().current.token).getLongPullServer();

  //await VKAccountRemote(AccountsRepository().current.token).registerDevice();

  //await VKAccountRemote(AccountsRepository().current.token).getPushSettings();

  // await VKAccountRemote(AccountsRepository().current.token).setPushSettings();

  // await VKAccountRemote(AccountsRepository().current.token).getPushSettings();
  
  runApp(Injector(child: App()));
}
