import 'package:hive/hive.dart';

import '../models/chat/chat_settings_model.dart';
import '../models/chat/conversation_model.dart';
import '../models/chat/peer_model.dart';
import '../models/chat/photo_model.dart';
import '../models/user/user_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DbRepositoryImpl {
  Future init() async {
    await Hive.initFlutter();

    //Стремно
    Hive
      ..registerAdapter(ConversationModelAdapter())
      ..registerAdapter(PeerModelAdapter())
      ..registerAdapter(ChatSettingsModelAdapter())
      ..registerAdapter(PhotoModelAdapter())
      ..registerAdapter(UserModelAdapter());

    // await openBox<ConversationModel>('conversation');
  }

  Future<Box> getBox<T>(String name) async {
    if (Hive.isBoxOpen(name))
      return Hive.box(name);
    else
      return await Hive.openBox<T>(name);
  }
}
