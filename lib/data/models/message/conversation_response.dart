import 'conversation.dart';
import 'message.dart';

class ConversationResponse {
  ConversationResponse({this.conversation, this.lastMessage});

  Conversation conversation;

  Message lastMessage;

  factory ConversationResponse.fromJson(Map<String, dynamic> json) {
    return ConversationResponse(
        conversation: Conversation.fromJson(json['conversation']),
        lastMessage: Message.fromJson(json['last_message']));
  }

  @override
  String toString() => '$conversation $lastMessage';
}
