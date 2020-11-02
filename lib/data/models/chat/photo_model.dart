import 'dart:convert';

import 'package:hive/hive.dart';

part 'photo_model.g.dart';

@HiveType(typeId: 4)
class PhotoModel {
  PhotoModel({this.photo50, this.photo100, this.photo200});
  // photo_50 (string) — URL изображения 50x50px;

  @HiveField(0)
  final String photo50;
  // photo_100 (string) — URL изображения 100x100px;
  @HiveField(1)
  final String photo100;
  // photo_200 (string) — URL изображения 200x200px;
  @HiveField(2)
  final String photo200;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'photo_50': photo50,
      'photo_100': photo100,
      'photo_200': photo200,
    };
  }

  factory PhotoModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return PhotoModel(
      photo50: map['photo_50'] as String,
      photo100: map['photo_100'] as String,
      photo200: map['photo_200'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PhotoModel.fromJson(String source) =>
      PhotoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
