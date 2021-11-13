// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../config.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ConfigAdapter extends TypeAdapter<Config> {
  @override
  final int typeId = 0;

  @override
  Config read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Config(
      itsTheFirtsTime: fields[0] as bool,
      token: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Config obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.itsTheFirtsTime)
      ..writeByte(1)
      ..write(obj.token);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConfigAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
