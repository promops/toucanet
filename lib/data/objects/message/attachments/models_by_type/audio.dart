import 'package:toucanet/data/objects/message/attachments/attachment.dart';

class Audio extends Attachment {
  Audio({this.id, this.title, this.url, this.artist});
  final int id;
  final String title;
  final String url;
  final String artist;

  factory Audio.fromJson(Map<String, dynamic> json) {
    return Audio(
        id: json['id'],
        title: json['title'],
        url: json['url'],
        artist: json['artist']);
  }
}
