import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
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

  List<Message> messages;

  @override
  String toString() => '$title $lastMessage';

  @override
  List<Object> get props => [peerId];
}
