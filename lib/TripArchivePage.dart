part of 'main.dart';

class TripArchivePage extends StatefulWidget {
  const TripArchivePage({Key? key}) : super(key: key);

  @override
  _TripArchivePageState createState() => _TripArchivePageState();
}

class _TripArchivePageState extends State<TripArchivePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('All Saved Triplogs'),
      ),
      body: ValueListenableBuilder(
        valueListenable: tripList.listenable(),
        builder: (context, box, widget) {
          _activeTrip = tripList.get('active_trip') ?? _activeTrip;
          return Scrollbar(
              child: ListView(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
            children: _renderArchive(context),
          ));
        },
      ),
    );
  }
}

List<ListTile> _renderArchive(BuildContext context) {
  List<ListTile> tmp = [];
  for (var k in tripList.keys.toList().reversed) {
    TripRecord? r = tripList.get(k);
    tmp.add(ListTile(
      title: Text(r!.substances.length > 0
          ? (formatter.format(
              DateTime.parse(r.substances.first.timestamp ?? 'NullStamp')))
          : 'NoSubstances'),
      subtitle: Text((r.key == 'active_trip'
          ? 'Active Triplog'
          : substanceSet(r.substances, r.notes))),
      onTap: () {
        print('Archived article tapped, k = $k');
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => TripLogPage(
                  tripKey: k,
                )));
      },
    ));
  }
  return tmp;
}

String substanceSet(HiveList<Substance> substances, [HiveList<Note>? notes]) {
  Set<String> unique = {};
  for (var s in substances) {
    unique.add(s.name ?? '');
  }
  if (notes != null && notes.length > 0) {
    unique.add('${notes.length} Note${notes.length > 1 ? 's' : ''}');
  }
  return unique.toString();
}
