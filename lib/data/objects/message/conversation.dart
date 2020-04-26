import 'message.dart';
import 'peer.dart';

class Conversation {
  Conversation(
      {this.peer,
      this.lastMessageId,
      this.inRead,
      this.outRead
      
      });

  final Peer peer;

  final int lastMessageId;

  final int inRead;

  final int outRead;

  // String avatarUrl;

  // String senderFirstName;

  // String senderLastName;

  // Message lastMessage;

  factory Conversation.fromJson(Map<String, dynamic> json) {
    return Conversation(
      peer: Peer.fromJson(json['peer']),
      inRead: json['in_read'],
      outRead: json['out_read'],
    );
  }

  @override
  String toString() => '$peer';
}
