import 'package:hive/hive.dart';
import 'package:toucanet/data/models/chat/conversation_model.dart';

class ConversationBox {
  var box = Hive.openBox<ConversationModel>('conversation');
}
