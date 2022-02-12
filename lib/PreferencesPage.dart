part of 'main.dart';

class PreferencesPage extends StatefulWidget {
  const PreferencesPage({Key? key}) : super(key: key);

  @override
  State<PreferencesPage> createState() => _PreferencesPageState();
}

class _PreferencesPageState extends State<PreferencesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferences'),
      ),
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(32.0),
              child: SwitchListTile(
                title: const Text('Enable App Lock'),
                value: preferences.get('enableLock', defaultValue: false),
                onChanged: (bool value) {
                  setState(() {
                    preferences.put('enableLock', value);
                  });
                },
                secondary: const Icon(Icons.lock),
              )),
          if (preferences.get('enableLock', defaultValue: false))
            Padding(
                padding: const EdgeInsets.all(32.0),
                child: ListTile(
                  title: const Text('Unlock PIN'),
                  // value: //move this value into the subtitle I think.
                  //     preferences.get('pinCode', defaultValue: false),
                  onTap: () {
                    setState(() {
                      //Open Applock's pin page for setting pin
                      //Set pin
                    });
                  },
                )),
          if (preferences.get('enableLock', defaultValue: false) &&
              canBiometrics)
            Padding(
                padding: const EdgeInsets.all(32.0),
                child: SwitchListTile(
                  title: const Text('Enable Fingerprint Unlock'),
                  value:
                      preferences.get('enableBiometrics', defaultValue: false),
                  onChanged: (bool value) {
                    setState(() {
                      preferences.put('enableBiometrics', value);
                    });
                  },
                  secondary: const Icon(Icons.fingerprint),
                )),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Row(
              children: [Text('TESTING')],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Row(
              children: [Text('TESTING')],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Row(
              children: [Text('TESTING')],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Row(
              children: [Text('TESTING')],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Row(
              children: [Text('TESTING')],
            ),
          ),
        ],
      ),
    );
  }
}
