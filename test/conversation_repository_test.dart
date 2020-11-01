import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/mockito.dart';
import 'package:toucanet/data/models/chat/conversation_model.dart';
import 'package:toucanet/data/models/chat/peer_model.dart';
import 'package:toucanet/data/repositories/conversation_box.dart';
import 'package:toucanet/data/repositories/conversation_repository_impl.dart';
import 'package:toucanet/data/repositories/db_repository_impl.dart';

class MockConversationBox extends Mock implements ConversationBox {}

class MockBox<T> extends Mock implements Box<T> {}

main() {
  final model =
      ConversationModel(peer: PeerModel(id: 0, localId: 1, type: 'test'));
  final model2 =
      ConversationModel(peer: PeerModel(id: 0, localId: 2, type: 'test2'));

  final modelsList = [model, model2];

  group('conversation test', () {
    final mockConversationBox = MockConversationBox();
    final mockBox = MockBox<ConversationModel>();

    final db = DbRepositoryImpl();

    final conversationRepository =
        ConversationRepositoryImpl(db, mockConversationBox);

    when(mockConversationBox.box)
        .thenAnswer((_) async => Future.value(mockBox));
    when(mockBox.values).thenReturn(modelsList);

    test('return all models', () async {
      final result = await conversationRepository.getAll();

      expect(result, modelsList);
    });

    test('return saved model', () async {
      final model =
          ConversationModel(peer: PeerModel(id: 0, localId: 1, type: 'test3'));

      await conversationRepository.save<ConversationModel>(model);

      verify(mockBox.add(model));
    });

    test('delete model', () async {
      final model =
          ConversationModel(peer: PeerModel(id: 0, localId: 1, type: 'test3'));

      await conversationRepository.delete(model);

      verify(mockBox.delete(model.key()));
    });
  });
}
