// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConversationModel _$ConversationModelFromJson(Map<String, dynamic> json) {
  return ConversationModel(
    peer: PeerModel.fromJson(json['peer'] as Map<String, dynamic>),
    inRead: json['in_read'] as int,
    lastMessageId: json['last_message_id'] as int,
    outRead: json['out_read'] as int,
    chatSettings: ChatSettingsModel.fromJson(
        json['chat_settings'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ConversationModelToJson(ConversationModel instance) =>
    <String, dynamic>{
      'peer': instance.peer.toJson(),
      'in_read': instance.inRead,
      'last_message_id': instance.lastMessageId,
      'out_read': instance.outRead,
      'chat_settings': instance.chatSettings.toJson(),
    };
