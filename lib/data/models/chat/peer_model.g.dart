// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'peer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PeerModel _$PeerModelFromJson(Map<String, dynamic> json) {
  return PeerModel(
    id: json['id'] as int,
    type: json['type'] as String,
    localId: json['local_id'] as int,
  );
}

Map<String, dynamic> _$PeerModelToJson(PeerModel instance) => <String, dynamic>{
      'local_id': instance.localId,
      'id': instance.id,
      'type': instance.type,
    };
