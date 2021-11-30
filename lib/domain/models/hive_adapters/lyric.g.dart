// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../lyric.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LyricAdapter extends TypeAdapter<Lyric> {
  @override
  final int typeId = 2;

  @override
  Lyric read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Lyric(
      id: fields[0] as int,
      name: fields[1] as String,
      lyric: fields[2] as String,
      genreId: fields[3] as String,
      groupId: fields[4] as String,
      genre: fields[5] as Genre,
      updatedAt: fields[6] as DateTime?,
      createdAt: fields[7] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, Lyric obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.lyric)
      ..writeByte(3)
      ..write(obj.genreId)
      ..writeByte(4)
      ..write(obj.groupId)
      ..writeByte(5)
      ..write(obj.genre)
      ..writeByte(6)
      ..write(obj.updatedAt)
      ..writeByte(7)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LyricAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
