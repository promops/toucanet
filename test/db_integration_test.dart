import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:toucanet/data/models/chat/chat_settings_model.dart';
import 'package:toucanet/data/models/chat/conversation_model.dart';
import 'package:toucanet/data/models/chat/peer_model.dart';
import 'package:toucanet/data/models/chat/photo_model.dart';
import 'package:toucanet/data/models/user/user_model.dart';
import 'package:toucanet/data/repositories/conversation_box.dart';
import 'package:toucanet/data/repositories/conversation_repository_impl.dart';
import 'package:toucanet/data/repositories/db_repository_impl.dart';

void initHive() async {
  await Hive
    ..initFlutter()
    ..registerAdapter(ConversationModelAdapter())
    ..registerAdapter(PeerModelAdapter())
    ..registerAdapter(ChatSettingsModelAdapter())
    ..registerAdapter(PhotoModelAdapter())
    ..registerAdapter(UserModelAdapter());

  // await Hive.deleteBoxFromDisk('conversation');

  // await Hive.deleteFromDisk();
}

main() async {
  await initHive();
  group('no unit tests', () {
    final model =
        ConversationModel(peer: PeerModel(id: 0, localId: 1, type: 'test'));

    test('check', () async {
      final db = DbRepositoryImpl();
      final conversationRepository =
          ConversationRepositoryImpl(db, ConversationBox());

      final list = await conversationRepository.getAll();

      await conversationRepository.save(model);

      expect(await conversationRepository.getAll(), list + [model]);
    });
  });
}
