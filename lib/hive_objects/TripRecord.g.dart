// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TripRecord.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TripRecordAdapter extends TypeAdapter<TripRecord> {
  @override
  final int typeId = 2;

  @override
  TripRecord read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TripRecord()
      ..startTime = fields[0] as String?
      ..contact = fields[1] as EmergencyContact?
      ..substances = (fields[2] as HiveList).castHiveList()
      ..notes = (fields[3] as HiveList).castHiveList();
  }

  @override
  void write(BinaryWriter writer, TripRecord obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.startTime)
      ..writeByte(1)
      ..write(obj.contact)
      ..writeByte(2)
      ..write(obj.substances)
      ..writeByte(3)
      ..write(obj.notes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TripRecordAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
