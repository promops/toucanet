import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:toucanet/app/models/message_view_model.dart';
import 'package:toucanet/data/objects/message/message.dart';

class ConversationViewModel extends Equatable {
  ConversationViewModel({
    this.avatarUrl,
    this.title,
    this.lastMessage,
    this.type,
    this.unreadCount = 0,
    this.lastMessageDate,
    @required this.peerId,
    @required this.online,
    @required this.out,
  });
  String avatarUrl;

  String title;

  String lastMessage;

  String lastMessageDate;

  int peerId;

  int unreadCount;

  String type;

  bool online;

  bool out;

  List<MessageViewModel> messages = [];

  void addMessage(MessageViewModel message) {
    this.messages.add(message);
  }

  @override
  String toString() => '$title $lastMessage';

  @override
  List<Object> get props => [peerId];
}
