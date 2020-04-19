import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:toucanet/app/app.dart';
import 'package:toucanet/app/injector.dart';
import 'package:toucanet/core/helper/config.dart';
import 'package:toucanet/core/notification/push_manager.dart';
import 'package:toucanet/data/remotes/vk_account_remote.dart';
import 'package:toucanet/data/remotes/vk_longpull_remote.dart';
import 'package:toucanet/data/remotes/vk_messages_remote.dart';
import 'package:toucanet/data/remotes/vk_users_remote.dart';
import 'package:toucanet/data/repositories/accounts_repository.dart';

import 'data/services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Config().load(['vk', 'app']);
  await AccountsRepository().init();

  print(Config());

  // PushManager().init();

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
