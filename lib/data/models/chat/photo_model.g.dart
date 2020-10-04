// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotoModel _$PhotoModelFromJson(Map<String, dynamic> json) {
  return PhotoModel(
    photo50: json['photo_50'] as String,
    photo100: json['photo_100'] as String,
    photo200: json['photo_200'] as String,
  );
}

Map<String, dynamic> _$PhotoModelToJson(PhotoModel instance) =>
    <String, dynamic>{
      'photo_50': instance.photo50,
      'photo_100': instance.photo100,
      'photo_200': instance.photo200,
    };
