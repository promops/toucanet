import '../models/chat/conversation_model.dart';
import 'conversation_box.dart';
import 'db_repository_impl.dart';
import '../../domain/repositories/db_repository.dart';

class ConversationRepositoryImpl implements DbRepository<ConversationModel> {
  final DbRepositoryImpl dbRepository;
  final ConversationBox conversationBox;

  ConversationRepositoryImpl(this.dbRepository, this.conversationBox);

  /// If it does not exist, nothing happens.
  @override
  Future<void> delete(ConversationModel model) async {
    final box = await conversationBox.box;
    await box.delete(model.key());
  }

  @override
  Future<void> save<M>(M model) async {
    final box = await conversationBox.box;
    if (model is ConversationModel) await box.add(model);

    if (model is List<ConversationModel>) await box.addAll(model);
  }

  @override
  Future<ConversationModel> get(String id) async {
    final box = await conversationBox.box;
    return box.get(id);
  }

  @override
  Future<List<ConversationModel>> getAll() async {
    final box = await conversationBox.box;
    return box.values.toList();
  }
}
