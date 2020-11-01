import 'package:toucanet/data/models/chat/conversation_model.dart';

abstract class DbRepository<T> {
  Future save<T>(T model);
  void delete(ConversationModel model);
  get(String id);
  Future<List<T>> getAll();
}
