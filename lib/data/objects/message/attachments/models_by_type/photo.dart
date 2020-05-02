import 'package:toucanet/data/objects/message/attachments/attachment.dart';

class Photo extends Attachment {
  Photo({this.id, this.sizes});
  final int id;
  final List<PhotoSize> sizes;

  factory Photo.fromJson(Map<String, dynamic> json) {
    List<PhotoSize> sizes = [];

    json['sizes'].forEach((size) => sizes.add(PhotoSize.fromJson(size)));
    return Photo(id: json['id'], sizes: sizes);
  }

  @override
  String toString() => '$id $sizes';
}

class PhotoSize {
// url (string) — url копии изображения;
// width (integer) — ширина копии в пикселах;
// height (integer) — высота копии в пикселах;
// type (string) — обозначение размера и пропорций копии.

  PhotoSize({this.url, this.width, this.height, this.type});
  final String url;
  final int width;
  final int height;
  final String type;

  factory PhotoSize.fromJson(Map<String, dynamic> json) {
    return PhotoSize(
        url: json['url'],
        width: json['width'],
        height: json['height'],
        type: json['type']);
  }
  @override
  String toString() => '$url $type';
}
