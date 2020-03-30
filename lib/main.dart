import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:toucanet/app/app.dart';
import 'package:toucanet/app/injector.dart';
import 'package:toucanet/core/config/config.dart';
import 'package:toucanet/data/repositories/accounts_repository.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  
  await Config.load();
  await AccountsRepository().init();

  //AuthService().isAuth(AccountsRepository().current);
  //await AccountsRepository().clearAll();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  
  runApp(Injector(child: App()));
}