import 'chat_settings.dart';
import 'peer.dart';

class Conversation {
  Conversation(
      {this.peer,
      this.lastMessageId,
      this.inRead,
      this.outRead,
      this.chatSettings});

  final Peer peer;

  final int lastMessageId;

  final int inRead;

  final int outRead;

  final ChatSettings chatSettings;

  factory Conversation.fromJson(Map<String, dynamic> json) {
    return Conversation(
      peer: Peer.fromJson(json['peer']),
      inRead: json['in_read'],
      outRead: json['out_read'],
      chatSettings: json['chat_settings'] != null ? ChatSettings.fromJson(json['chat_settings']) : null
    );
  }

  @override
  String toString() => '$peer';
}
