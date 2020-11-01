// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_settings_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChatSettingsModelAdapter extends TypeAdapter<ChatSettingsModel> {
  @override
  final int typeId = 3;

  @override
  ChatSettingsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChatSettingsModel(
      ownerId: fields[0] as int,
      title: fields[1] as String,
      state: fields[2] as String,
      photo: fields[3] as PhotoModel,
      isGroupChannel: fields[4] as bool,
      activeIds: (fields[5] as List)?.cast<int>(),
    );
  }

  @override
  void write(BinaryWriter writer, ChatSettingsModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.ownerId)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.state)
      ..writeByte(3)
      ..write(obj.photo)
      ..writeByte(4)
      ..write(obj.isGroupChannel)
      ..writeByte(5)
      ..write(obj.activeIds);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChatSettingsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
