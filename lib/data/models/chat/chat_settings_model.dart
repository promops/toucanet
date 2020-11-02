import 'dart:convert';

import 'package:hive/hive.dart';

import 'photo_model.dart';

part 'chat_settings_model.g.dart';

@HiveType(typeId: 3)
class ChatSettingsModel {
  ChatSettingsModel({
    this.ownerId,
    this.title,
    this.state,
    this.photo,
    this.isGroupChannel,
    this.activeIds,
  });

  @HiveField(0)
  final int ownerId;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String state;
  @HiveField(3)
  final PhotoModel photo;
  @HiveField(4)
  final bool isGroupChannel;
  @HiveField(5)
  final List<int> activeIds;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'owner_id': ownerId,
      'title': title,
      'state': state,
      'photo': photo?.toMap(),
      'is_group_channel': isGroupChannel,
      'active_ids': activeIds,
    };
  }

  factory ChatSettingsModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ChatSettingsModel(
      ownerId: int.tryParse(map['owner_id'] as String),
      title: map['title'] as String,
      state: map['state'] as String,
      photo: PhotoModel.fromMap(map['photo'] as Map<String, dynamic>),
      isGroupChannel: map['is_group_channel'] as bool,
      activeIds: List<int>.from(map['active_ids'] as Iterable),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatSettingsModel.fromJson(String source) =>
      ChatSettingsModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
