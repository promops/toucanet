import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:toucanet/app/application.dart';

import 'package:toucanet/view/app_view.dart';
import 'package:toucanet/view/app_injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  final app = Application()
    ..options.numberOfWorkers = 2
    ..options.configurationFiles = ['vk', 'app'];

  await app.start();

  runApp(AppInjector(child: AppView(), app: app));


}