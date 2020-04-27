import 'photo.dart';

class ChatSettings {
  ChatSettings(
      {this.ownerId, this.title, this.state, this.photo, this.activeIds});
  final int ownerId;

  final String title;

  final String state;

  final Photo photo;

  List<int> activeIds;

  factory ChatSettings.fromJson(Map<String, dynamic> json) {
    return ChatSettings(
        ownerId: json['owner_id'],
        title: json['title'],
        photo: json['photo'] != null ? Photo.fromJson(json['photo']) : null,
        activeIds: json['active_ids'].cast<int>());
  }
}
