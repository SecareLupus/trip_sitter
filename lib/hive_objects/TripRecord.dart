import 'package:flutter/material.dart' show ListTile;
import 'package:hive/hive.dart';
import 'package:trip_sitter/hive_objects/EmergencyContact.dart';
import 'package:trip_sitter/hive_objects/Note.dart';
import 'package:trip_sitter/hive_objects/Substance.dart';
import 'package:trip_sitter/main.dart';

part 'TripRecord.g.dart';

@HiveType(typeId: 2)
class TripRecord extends HiveObject {
  @Deprecated(
      'Trip start times should be calculated from the timestamp on the 0th item in the Substance HiveList.')
  @HiveField(0)
  String? startTime;
  @HiveField(1)
  EmergencyContact? contact;
  @HiveField(2)
  HiveList<Substance> substances = HiveList(substanceList, objects: []);
  @HiveField(3)
  HiveList<Note> notes = HiveList(noteList, objects: []);

  List<ListTile> get allLogs {
    return [];
  }

  int get countLogs => substances.length + notes.length;
}
