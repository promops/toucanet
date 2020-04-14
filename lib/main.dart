import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:toucanet/app/app.dart';
import 'package:toucanet/app/injector.dart';
import 'package:toucanet/core/config/config.dart';
import 'package:toucanet/data/remotes/vk_longpull_remote.dart';
import 'package:toucanet/data/remotes/vk_messages_remote.dart';
import 'package:toucanet/data/remotes/vk_users_remote.dart';
import 'package:toucanet/data/repositories/accounts_repository.dart';

import 'data/services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Config.load();
  await AccountsRepository().init();

  //AuthService().isAuth(AccountsRepository().current);
  //await AccountsRepository().clearAll();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  //VKUsersRemote(AccountsRepository().current.token).getUser();

  //VKMessagesRemote(AccountsRepository().current.token).getById([552885]);

  await VKLongpullRemote(AccountsRepository().current.token).getLongPullServer();
  
  runApp(Injector(child: App()));
}
