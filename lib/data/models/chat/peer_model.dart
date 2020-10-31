import 'package:json_annotation/json_annotation.dart';

part 'peer_model.g.dart';

//flutter packages pub run build_runner build
//--delete-conflicting-outputs

@JsonSerializable(explicitToJson: true)
class PeerModel {
  PeerModel({this.id, this.type, this.localId});

  @JsonKey(name: 'local_id')
  final int localId;

  final int id;

  final String type;

  factory PeerModel.fromJson(Map<String, dynamic> json) =>
      _$PeerModelFromJson(json);

  Map<String, dynamic> toJson() => _$PeerModelToJson(this);
}
