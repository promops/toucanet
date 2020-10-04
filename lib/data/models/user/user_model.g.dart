// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    id: json['id'] as int,
    firstName: json['first_name'] as String,
    lastName: json['last_name'] as String,
    deactivated: json['deactivated'] as String,
    isClosed: json['is_closed'] as String,
    canAccessClosed: json['can_access_closed'] as bool,
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'deactivated': instance.deactivated,
      'is_closed': instance.isClosed,
      'can_access_closed': instance.canAccessClosed,
    };
