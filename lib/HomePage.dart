part of 'main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String _title = 'TripSitter Harm Reduction';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    _activeTrip = tripList.get('active_trip');

    List<Widget> activeTripButtons = [
      MaterialButton(
        onPressed: () {
          Navigator.pushNamed(context, '/active').then((value) {
            setState(() {});
          });
        },
        padding: EdgeInsets.all(25.0),
        color: Colors.red,
        shape: StadiumBorder(),
        textColor: Colors.black,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.note_alt_outlined),
            SizedBox(
              width: 15.0,
            ),
            Text(
              'Active Triplog (${_activeTrip?.countLogs ?? 0})',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      if (tripList.length > 0) ...[
        SizedBox(
          height: 25.0,
        ),
        MaterialButton(
          onPressed: () {
            Navigator.pushNamed(context, '/archive').then((value) {
              setState(() {});
            });
          },
          padding: EdgeInsets.all(25.0),
          color: Colors.red,
          shape: StadiumBorder(),
          textColor: Colors.black,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.archive_outlined),
              SizedBox(
                width: 15.0,
              ),
              Text(
                'Triplog Archive',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
      SizedBox(
        height: 25.0,
      ),
      MaterialButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/about',
          );
        },
        padding: EdgeInsets.all(25.0),
        color: Colors.red,
        shape: StadiumBorder(),
        textColor: Colors.black,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.quiz_outlined),
            SizedBox(
              width: 15.0,
            ),
            Text(
              'About TripSitter',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(HomePage._title),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/preferences');
            },
            icon: Icon(Icons.settings),
          ),
          if (preferences.get('enableLock', defaultValue: false))
            IconButton(
              onPressed: () {
                AppLock.of(context)!.showLockScreen();
              },
              icon: Icon(Icons.lock_outline),
            ),
        ],
      ),
      body: Center(
        child: Builder(builder: (context) {
          return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: activeTripButtons);
        }),
      ),
    );
  }
}
