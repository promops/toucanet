// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ConversationModelAdapter extends TypeAdapter<ConversationModel> {
  @override
  final int typeId = 1;

  @override
  ConversationModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ConversationModel(
      peer: fields[0] as PeerModel,
      inRead: fields[1] as int,
      lastMessageId: fields[2] as int,
      outRead: fields[3] as int,
      chatSettings: fields[4] as ChatSettingsModel,
    );
  }

  @override
  void write(BinaryWriter writer, ConversationModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.peer)
      ..writeByte(1)
      ..write(obj.inRead)
      ..writeByte(2)
      ..write(obj.lastMessageId)
      ..writeByte(3)
      ..write(obj.outRead)
      ..writeByte(4)
      ..write(obj.chatSettings);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConversationModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
