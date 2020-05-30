import 'package:toucanet/app/models/conversation_view_model.dart';
import 'package:toucanet/app/models/message_view_model.dart';

abstract class Stored {
  void addMessage(MessageViewModel message);

  MessageViewModel getMessages();

  List<ConversationViewModel> getConversations();


}
