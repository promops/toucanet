import 'package:json_annotation/json_annotation.dart';

import 'package:toucanet/data/models/chat/chat_settings_model.dart';
import 'package:toucanet/data/models/chat/photo_model.dart';

part 'chat_settings_model.g.dart';

@JsonSerializable(nullable: false, explicitToJson: true)
class ChatSettingsModel {
  ChatSettingsModel({
    this.ownerId,
    this.title,
    this.state,
    this.photo,
    this.isGroupChannel,
    this.activeIds,
  });

  @JsonKey(name: 'owner_id')
  final int ownerId;

  final String title;

  final String state;

  final PhotoModel photo;
  @JsonKey(name: 'is_group_channel')
  final bool isGroupChannel;
  @JsonKey(name: 'active_ids ')
  final List<int> activeIds;
}
