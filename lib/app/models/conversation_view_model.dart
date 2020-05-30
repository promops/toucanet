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
    @required this.peerId,
    @required this.online,
    @required this.out,
  });
  final String avatarUrl;

  final String title;

  final String lastMessage;

  final int peerId;

  final String type;

  bool online;

  bool out;

  List<MessageViewModel> _messages;

  void addMessage(MessageViewModel message) {
    this._messages.add(message);
  }

  @override
  String toString() => '$title $lastMessage';

  @override
  List<Object> get props => [peerId];
}
