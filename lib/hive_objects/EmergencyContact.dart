import 'package:hive/hive.dart';
import 'package:trip_sitter/hive_objects/ContactMethod.dart';

part 'EmergencyContact.g.dart';

@HiveType(typeId: 0)
class EmergencyContact extends HiveObject {
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? contactAddress;
  @HiveField(2)
  ContactMethod? method;
}
