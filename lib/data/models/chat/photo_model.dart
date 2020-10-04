import 'package:json_annotation/json_annotation.dart';

part 'photo_model.g.dart';

//flutter packages pub run build_runner build
//--delete-conflicting-outputs

@JsonSerializable(explicitToJson: true)
class PhotoModel {
  PhotoModel({this.photo50, this.photo100, this.photo200});
  // photo_50 (string) — URL изображения 50x50px;
  @JsonKey(name: 'photo_50')
  final String photo50;
  // photo_100 (string) — URL изображения 100x100px;
  @JsonKey(name: 'photo_100')
  final String photo100;
  // photo_200 (string) — URL изображения 200x200px;
  @JsonKey(name: 'photo_200')
  final String photo200;

  factory PhotoModel.fromJson(Map<String, dynamic> json) =>
      _$PhotoModelFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoModelToJson(this);
}
