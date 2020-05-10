import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/app.dart';
import 'app/injector.dart';
import 'core/helper/config.dart';
import 'core/vk/vk_api_client.dart';
import 'data/repositories/accounts_repository.dart';
import 'data/services/messages_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Config().load(['vk', 'app']);
  await AccountsRepository().init();

  VKApiClient(AccountsRepository().current.token).longPoll;

  //await PushManager().init();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);


  //await WorkersManager().init(workersCount: 1);

  //await VKMessagesRemote(AccountsRepository().current.token).getConversations(2);
  // await VKMessagesRemote(AccountsRepository().current.token).getHistory(5, 50123451);

  //await MessagesService().getConversations(0);
 
  runApp(Injector(child: App()));
}




