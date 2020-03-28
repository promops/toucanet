import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:toucanet/app/app.dart';
import 'package:toucanet/app/injector.dart';
import 'package:toucanet/core/config/config.dart';
import 'package:toucanet/data/repositories/account_repository.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  
  await Config.load();
  await AccountRepository().init();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  
  runApp(Injector(child: App()));
}