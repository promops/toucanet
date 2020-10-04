import 'package:json_annotation/json_annotation.dart';
import 'package:toucanet/data/models/chat/chat_settings_model.dart';

import 'peer_model.dart';

part 'conversation_model.g.dart';

//flutter packages pub run build_runner build
//--delete-conflicting-outputs

@JsonSerializable(explicitToJson: true)
class ConversationModel {
  ConversationModel(
      {this.peer,
      this.inRead,
      this.lastMessageId,
      this.outRead,
      this.chatSettings});

  final PeerModel peer;

  @JsonKey(name: 'in_read')
  final int inRead;
  @JsonKey(name: 'last_message_id')
  final int lastMessageId;
  @JsonKey(name: 'out_read')
  final int outRead;
  //Настройки чата.
  @JsonKey(name: 'chat_settings')
  final ChatSettingsModel chatSettings;

  factory ConversationModel.fromJson(Map<String, dynamic> json) =>
      _$ConversationModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConversationModelToJson(this);
}
