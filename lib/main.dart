import 'dart:async';
import 'dart:io';
import 'dart:isolate';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:toucanet/app/app.dart';
import 'package:toucanet/app/injector.dart';
import 'package:toucanet/core/helper/config.dart';
import 'package:toucanet/core/worker/workers_manager.dart';
import 'package:toucanet/data/remotes/vk_account_remote.dart';
import 'package:toucanet/data/remotes/vk_longpull_remote.dart';
import 'package:toucanet/data/remotes/vk_messages_remote.dart';
import 'package:toucanet/data/remotes/vk_users_remote.dart';
import 'package:toucanet/data/repositories/accounts_repository.dart';

import 'core/helper/push_manager.dart';
import 'core/worker/task.dart';
import 'data/services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Config().load(['vk', 'app']);
  await AccountsRepository().init();
  await PushManager().init();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);


  await WorkersManager().init(workersCount: 1);

  Task task = Task(runTimer);

  WorkersManager().workers[0].execute(task);


   WorkersManager().workers[0].getBroadcast().listen((data) => print(data));
   
 
  runApp(Injector(child: App()));
}

void runTimer(SendPort sendPort) {
  int counter = 0;
  Timer.periodic(Duration(seconds: 1), (Timer t) {
    counter++;
    String msg = 'notification ' + counter.toString();  
    stdout.write('SEND: ' + msg + ' - ');  
    sendPort.send(msg);
  });
}


