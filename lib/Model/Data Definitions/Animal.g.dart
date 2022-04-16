// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Animal.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AnimalAdapter extends TypeAdapter<Animal> {
  @override
  final int typeId = 0;

  @override
  Animal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Animal(
      fields[0] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, Animal obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.rawJsonString);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnimalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
