import 'package:toucanet/data/objects/message/conversation.dart';

import 'message.dart';

class ConversationResponse {
  ConversationResponse({this.conversation, this.lastMessage});

  final Conversation conversation;

  final Message lastMessage;

  factory ConversationResponse.fromJson(Map<String, dynamic> json) =>
      ConversationResponse(
          conversation: Conversation.fromJson(json['conversation']),
          lastMessage: Message.fromJson(json['last_message']));

  @override
  String toString() => '$conversation $lastMessage';
}
