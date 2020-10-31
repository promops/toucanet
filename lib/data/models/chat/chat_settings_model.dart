import 'package:json_annotation/json_annotation.dart';

import 'photo_model.dart';

part 'chat_settings_model.g.dart';

//flutter packages pub run build_runner build
//--delete-conflicting-outputs

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

  factory ChatSettingsModel.fromJson(Map<String, dynamic> json) =>
      _$ChatSettingsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChatSettingsModelToJson(this);
}
