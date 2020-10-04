// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_settings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatSettingsModel _$ChatSettingsModelFromJson(Map<String, dynamic> json) {
  return ChatSettingsModel(
    ownerId: json['owner_id'] as int,
    title: json['title'] as String,
    state: json['state'] as String,
    photo: PhotoModel.fromJson(json['photo'] as Map<String, dynamic>),
    isGroupChannel: json['is_group_channel'] as bool,
    activeIds: (json['active_ids '] as List).map((e) => e as int).toList(),
  );
}

Map<String, dynamic> _$ChatSettingsModelToJson(ChatSettingsModel instance) =>
    <String, dynamic>{
      'owner_id': instance.ownerId,
      'title': instance.title,
      'state': instance.state,
      'photo': instance.photo.toJson(),
      'is_group_channel': instance.isGroupChannel,
      'active_ids ': instance.activeIds,
    };
