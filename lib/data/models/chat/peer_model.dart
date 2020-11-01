import 'dart:convert';

import 'package:hive/hive.dart';

part 'peer_model.g.dart';

@HiveType(typeId: 2)
class PeerModel {
  PeerModel({this.id, this.type, this.localId});

  @HiveField(0)
  final int localId;
  @HiveField(1)
  final int id;
  @HiveField(2)
  final String type;

  Map<String, dynamic> toMap() {
    return {
      'local_id': localId,
      'id': id,
      'type': type,
    };
  }

  factory PeerModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return PeerModel(
      localId: map['local_id'],
      id: map['id'],
      type: map['type'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PeerModel.fromJson(String source) =>
      PeerModel.fromMap(json.decode(source));
}
