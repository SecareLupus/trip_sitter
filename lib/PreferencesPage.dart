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
          SizedBox(
            height: 10.0,
          ),
          SwitchListTile(
            title: const Text('Enable App Lock'),
            value: preferences.get('enableLock', defaultValue: false),
            onChanged: (bool value) {
              setState(() {
                preferences.put('enableLock', value);
              });
            },
            secondary: const Icon(Icons.lock),
          ),
          if (preferences.get('enableLock', defaultValue: false))
            ListTile(
              title: const Text('Reset Unlock PIN'),
              subtitle: Text(
                  'Current PIN: ${preferences.get('pinCode', defaultValue: 'XXXX')}'),
              onTap: () {
                screenLock(
                    context: context,
                    correctString: '',
                    canCancel: true,
                    confirmation: true,
                    didConfirmed: (newValue) {
                      setState(() {
                        preferences.put('pinCode', newValue);
                      });
                      Navigator.pop(context);
                    });
              },
            ),
          if (preferences.get('enableLock', defaultValue: false) &&
              canBiometrics)
            SwitchListTile(
              title: const Text('Enable Fingerprint Unlock'),
              value: preferences.get('enableBiometrics', defaultValue: false),
              onChanged: (bool value) {
                setState(() {
                  preferences.put('enableBiometrics', value);
                });
              },
              secondary: const Icon(Icons.fingerprint),
            ),
        ],
      ),
    );
  }
}
