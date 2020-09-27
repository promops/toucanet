import 'package:json_annotation/json_annotation.dart';

part 'peer_model.g.dart';

@JsonSerializable(nullable: false)
class PeerModel {
  PeerModel({this.id, this.type, this.localId});

  @JsonKey(name: 'local_id')
  final int localId;

  final int id;

  final String type;
  
}
