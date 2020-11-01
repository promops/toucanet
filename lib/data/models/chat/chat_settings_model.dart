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
    return {
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
      ownerId: map['owner_id'],
      title: map['title'],
      state: map['state'],
      photo: PhotoModel.fromMap(map['photo']),
      isGroupChannel: map['is_group_channel'],
      activeIds: List<int>.from(map['active_ids']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatSettingsModel.fromJson(String source) =>
      ChatSettingsModel.fromMap(json.decode(source));
}
