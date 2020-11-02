import '../../data/models/chat/conversation_model.dart';

abstract class DbRepository<T> {
  Future<void> save<M>(M model);
  Future<void> delete(ConversationModel model);

  Future<T> get(String id);
  Future<List<T>> getAll();
}
