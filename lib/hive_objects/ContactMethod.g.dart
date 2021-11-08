// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ContactMethod.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ContactMethodAdapter extends TypeAdapter<ContactMethod> {
  @override
  final int typeId = 1;

  @override
  ContactMethod read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ContactMethod.phone_call;
      case 1:
        return ContactMethod.phone_sms;
      case 2:
        return ContactMethod.email;
      default:
        return ContactMethod.phone_call;
    }
  }

  @override
  void write(BinaryWriter writer, ContactMethod obj) {
    switch (obj) {
      case ContactMethod.phone_call:
        writer.writeByte(0);
        break;
      case ContactMethod.phone_sms:
        writer.writeByte(1);
        break;
      case ContactMethod.email:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ContactMethodAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
