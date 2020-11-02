import 'package:hive/hive.dart';
import '../models/chat/conversation_model.dart';

class ConversationBox {
  final box = Hive.openBox<ConversationModel>('conversation');
}
