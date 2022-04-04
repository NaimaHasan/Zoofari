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
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
      fields[5] as String,
      fields[6] as String,
      fields[7] as String,
      fields[8] as String,
      fields[9] as String,
      fields[10] as String,
      fields[11] as String,
      fields[12] as String,
      fields[13] as String,
      fields[14] as String,
      fields[15] as String,
      fields[16] as String,
      fields[17] as String,
      fields[18] as String,
      fields[19] as String,
      (fields[20] as List).cast<dynamic>(),
      (fields[21] as List).cast<dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, Animal obj) {
    writer
      ..writeByte(22)
      ..writeByte(0)
      ..write(obj._commonName)
      ..writeByte(1)
      ..write(obj._scientificName)
      ..writeByte(2)
      ..write(obj._kingdom)
      ..writeByte(3)
      ..write(obj._phylum)
      ..writeByte(4)
      ..write(obj._class)
      ..writeByte(5)
      ..write(obj._order)
      ..writeByte(6)
      ..write(obj._family)
      ..writeByte(7)
      ..write(obj._genus)
      ..writeByte(8)
      ..write(obj._avgWeight)
      ..writeByte(9)
      ..write(obj._maxWeight)
      ..writeByte(10)
      ..write(obj._maxLength)
      ..writeByte(11)
      ..write(obj._maxSpeed)
      ..writeByte(12)
      ..write(obj._lifespan)
      ..writeByte(13)
      ..write(obj._lifestyle)
      ..writeByte(14)
      ..write(obj._skinType)
      ..writeByte(15)
      ..write(obj._funFact)
      ..writeByte(16)
      ..write(obj._diets)
      ..writeByte(17)
      ..write(obj._habitats)
      ..writeByte(18)
      ..write(obj._preys)
      ..writeByte(19)
      ..write(obj._predators)
      ..writeByte(20)
      ..write(obj._colors)
      ..writeByte(21)
      ..write(obj._imageLinks);
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
