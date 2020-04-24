import 'message.dart';
import 'peer.dart';

class Conversation {
  Conversation(
      {this.peer,
      this.lastMessageId,
      this.inRead,
      this.outRead,
      this.lastMessage});

  final Peer peer;

  final int lastMessageId;

  final int inRead;

  final int outRead;

  String avatarUrl;

  String senderFirstName;

  String senderLastName;

  Message lastMessage;

  factory Conversation.fromJson(Map<String, dynamic> json) {
    return Conversation(
      peer: Peer.fromJson(json['peer']),
      // lastMessage: json.containsKey('last_message')
      //     ? Message.fromJson(json['last_message'])
      //     : null,
      //lastMessage: Message.fromJson(json['last_message']),
      inRead: json['in_read'],
      outRead: json['out_read'],
    );
  }

  @override
  String toString() => '$peer';
}
