import 'dart:convert';
import 'package:hive/hive.dart';

import '../db_key.dart';

import 'peer_model.dart';
import 'chat_settings_model.dart';

part 'conversation_model.g.dart';

@HiveType(typeId: 1)
class ConversationModel extends DbKey {
  ConversationModel(
      {this.peer,
      this.inRead,
      this.lastMessageId,
      this.outRead,
      this.chatSettings});

  @HiveField(0)
  final PeerModel peer;

  @HiveField(1)
  final int inRead;

  @HiveField(2)
  final int lastMessageId;

  @HiveField(3)
  final int outRead;
  //Настройки чата.
  @HiveField(4)
  final ChatSettingsModel chatSettings;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'peer': peer?.toMap(),
      'in_read': inRead,
      'last_message_id': lastMessageId,
      'out_read': outRead,
      'chat_settings': chatSettings?.toMap(),
    };
  }

  factory ConversationModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ConversationModel(
      peer: PeerModel.fromMap(map['peer'] as Map<String, dynamic>),
      inRead: map['in_read'] as int,
      lastMessageId: map['last_message_id'] as int,
      outRead: map['out_read'] as int,
      chatSettings: ChatSettingsModel.fromMap(
          map['chat_settings'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ConversationModel.fromJson(String source) =>
      ConversationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String key() => '${peer.localId}';
}
