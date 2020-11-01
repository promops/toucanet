import 'package:hive/hive.dart';

import '../../domain/repositories/db_repository.dart';
import '../models/chat/chat_settings_model.dart';
import '../models/chat/conversation_model.dart';
import '../models/chat/peer_model.dart';
import '../models/chat/photo_model.dart';
import '../models/user/user_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DbRepositoryImpl implements DbRepository {
  Future init() async {
    await Hive.initFlutter();

    Hive
      ..registerAdapter(ConversationModelAdapter())
      ..registerAdapter(PeerModelAdapter())
      ..registerAdapter(ChatSettingsModelAdapter())
      ..registerAdapter(PhotoModelAdapter())
      ..registerAdapter(UserModelAdapter());

    var box = await Hive.openBox<ConversationModel>('conversations');

    await box.put(
        'key2',
        ConversationModel(
            peer: PeerModel(id: 3, type: 'assssss', localId: 2),
            inRead: 1,
            lastMessageId: 1,
            outRead: 1,
            chatSettings:
                ChatSettingsModel(ownerId: 1, title: '123', state: '234')));
    print(await box.get('key2'));

    // print(box.get('key1').toJson());
  }
}
