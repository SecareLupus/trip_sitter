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
          if (preferences.get('enableLock', defaultValue: false) &&
              canBiometrics)
            Padding(
                padding: const EdgeInsets.all(32.0),
                child: SwitchListTile(
                  title: const Text('Enable Biometric Unlock'),
                  value: true,
                  onChanged: (bool value) {
                    setState(() {});
                  },
                  secondary: const Icon(Icons.lock),
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
