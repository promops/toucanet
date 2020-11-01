import 'package:toucanet/data/models/chat/conversation_model.dart';
import 'package:toucanet/data/repositories/conversation_box.dart';
import 'package:toucanet/data/repositories/db_repository_impl.dart';
import 'package:toucanet/domain/repositories/db_repository.dart';

class ConversationRepositoryImpl implements DbRepository<ConversationModel> {
  final DbRepositoryImpl dbRepository;
  final ConversationBox conversationBox;

  ConversationRepositoryImpl(this.dbRepository, this.conversationBox);

  /// If it does not exist, nothing happens.
  @override
  Future delete(ConversationModel model) async {
    final box = await conversationBox.box;
    box.delete(model.key());
  }

  @override
  Future save<T>(T model) async {
    final box = await conversationBox.box;
    if (model is ConversationModel) await box.add(model);

    if (model is List<ConversationModel>) await box.addAll(model);
  }

  @override
  Future get(String id) async {
    final box = await conversationBox.box;
    return box.get(id);
  }

  @override
  Future<List<ConversationModel>> getAll() async {
    final box = await conversationBox.box;
    return box.values.toList();
  }
}
