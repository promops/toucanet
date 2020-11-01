// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'peer_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PeerModelAdapter extends TypeAdapter<PeerModel> {
  @override
  final int typeId = 2;

  @override
  PeerModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PeerModel(
      id: fields[1] as int,
      type: fields[2] as String,
      localId: fields[0] as int,
    );
  }

  @override
  void write(BinaryWriter writer, PeerModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.localId)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PeerModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
