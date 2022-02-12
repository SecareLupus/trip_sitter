import 'dart:io';

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
import 'package:flutter_app_lock/flutter_app_lock.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:local_auth/local_auth.dart';

part 'AutocompleteEntries.dart';
part 'HomePage.dart';
part 'util/InputDialogLib.dart';
part 'util/ListRendering.dart';
part 'TripLogPage.dart';
part 'AboutPage.dart';
part 'TripArchivePage.dart';
part 'PreferencesPage.dart';

late Box<TripRecord> tripList;
late Box<Substance> substanceList;
late Box<Note> noteList;
late Box preferences;
TripRecord? _activeTrip;

late final LocalAuthentication localauth;
late final bool canBiometrics;

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(ContactMethodAdapter());
  Hive.registerAdapter(EmergencyContactAdapter());
  Hive.registerAdapter(NoteAdapter());
  Hive.registerAdapter(SubstanceAdapter());
  Hive.registerAdapter(TripRecordAdapter());
  substanceList = await Hive.openBox<Substance>('substance_list');
  noteList = await Hive.openBox<Note>('note_list');
  tripList = await Hive.openBox<TripRecord>('trip_list');
  preferences = await Hive.openBox('preferences');
  _activeTrip = tripList.get('active_trip');

  Duration backgroundLockLatency = const Duration(seconds: 30);
  localauth = LocalAuthentication();
  try {
    canBiometrics = (Platform.isAndroid || Platform.isIOS) &&
        await localauth.canCheckBiometrics;
  } catch (e) {
    print(e);
    canBiometrics = false;
  }

  runApp(AppLock(
    builder: (args) => TripSit(),
    lockScreen: LockScreen(),
    enabled: preferences.get('enableLock', defaultValue: true),
    backgroundLockLatency: backgroundLockLatency,
  ));
}

class TripSit extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TripSitter Harm Reduction',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.red,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/active': (context) => TripLogPage(context),
        '/archive': (context) => TripArchivePage(),
        '/preferences': (context) => PreferencesPage(),
        '/about': (context) => AboutPage(),
      },
    );
  }
}

class LockScreen extends StatelessWidget {
  LockScreen({Key? key}) : super(key: key);

  Future<void> fingerprintDialog(BuildContext context) async {
    if (canBiometrics) {
      final didAuthenticate = await localauth.authenticate(
        localizedReason: 'Please authenticate',
        biometricOnly: true,
      );
      if (didAuthenticate) {
        AppLock.of(context)!.didUnlock();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Icon? fingerprintButton;
    if (canBiometrics) {
      fingerprintButton = Icon(Icons.fingerprint);
    }
    return ScreenLock(
      screenLockConfig: ScreenLockConfig(
        backgroundColor: Colors.grey[850],
      ),
      inputButtonConfig: InputButtonConfig(
          buttonStyle: OutlinedButton.styleFrom(
        backgroundColor: Colors.red,
        primary: Colors.black,
        side: BorderSide(color: Colors.white),
      )),
      canCancel: false,
      correctString: preferences.get('pinCode', defaultValue: '1111'),
      customizedButtonChild: fingerprintButton,
      customizedButtonTap: () async {
        await fingerprintDialog(context);
      },
      didUnlocked: () => AppLock.of(context)!.didUnlock(),
    );
  }
}
