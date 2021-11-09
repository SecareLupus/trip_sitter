import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:trip_sitter/hive_objects/ContactMethod.dart';
import 'package:trip_sitter/hive_objects/EmergencyContact.dart';
import 'package:trip_sitter/hive_objects/Note.dart';
import 'package:trip_sitter/hive_objects/Substance.dart';
import 'package:trip_sitter/hive_objects/TripRecord.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:url_launcher/url_launcher.dart';

part 'HomePage.dart';
part 'util/InputDialogLib.dart';
part 'util/ListRendering.dart';
part 'TripLogPage.dart';
part 'AboutPage.dart';
part 'TripArchivePage.dart';

late final Box<TripRecord> tripList;
late final Box<Substance> substanceList;
late final Box<Note> noteList;
TripRecord? _activeTrip;

void main() async {
  await Hive.initFlutter();
  // [
  //   // Only uncomment if you want to wipe the db on load.
  //   'trip_list',
  //   'substance_list',
  //   'note_list',
  // ].forEach((boxName) => Hive.deleteBoxFromDisk(boxName));

  Hive.registerAdapter(ContactMethodAdapter());
  Hive.registerAdapter(EmergencyContactAdapter());
  Hive.registerAdapter(NoteAdapter());
  Hive.registerAdapter(SubstanceAdapter());
  Hive.registerAdapter(TripRecordAdapter());
  substanceList = await Hive.openBox<Substance>('substance_list');
  noteList = await Hive.openBox<Note>('note_list');
  tripList = await Hive.openBox<TripRecord>('trip_list');
  _activeTrip = tripList.get('active_trip');
  runApp(TripSit());
}

class TripSit extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.red,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/active': (context) => TripLogPage(),
        '/archive': (context) => TripArchivePage(),
        '/archived': (context) => TripLogPage(),
        '/about': (context) => AboutPage(),
      },
    );
  }
}
