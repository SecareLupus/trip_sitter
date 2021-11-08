// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Substance.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SubstanceAdapter extends TypeAdapter<Substance> {
  @override
  final int typeId = 3;

  @override
  Substance read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Substance()
      ..name = fields[0] as String?
      ..doseTaken = fields[1] as double?
      ..doseGrade = fields[2] as String?
      ..timestamp = fields[3] as String?;
  }

  @override
  void write(BinaryWriter writer, Substance obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.doseTaken)
      ..writeByte(2)
      ..write(obj.doseGrade)
      ..writeByte(3)
      ..write(obj.timestamp);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubstanceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
