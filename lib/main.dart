import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:toucanet/app/app.dart';
import 'package:toucanet/app/injector.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  
  runApp(Injector(child: App()));
}