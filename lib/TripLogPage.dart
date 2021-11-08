part of 'main.dart';

class TripLogPage extends StatefulWidget {
  const TripLogPage({Key? key, this.tripKey = 'active_trip'}) : super(key: key);

  static const String _title = 'Current Trip Log';
  final dynamic tripKey;

  @override
  State<TripLogPage> createState() => _TripLogPageState();
}

class _TripLogPageState extends State<TripLogPage> {
  TripRecord? _currentRecord;

  initState() {
    super.initState();
    _currentRecord = tripList.get(widget.tripKey);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(TripLogPage._title),
        actions: _popupMenuActions(),
      ),
      body: ValueListenableBuilder(
        valueListenable: tripList.listenable(keys: [widget.tripKey]),
        builder: (context, box, wid) {
          _activeTrip = tripList.get('active_trip') ?? _activeTrip;
          return Scrollbar(
              child: ListView(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
            children: _renderList(key: widget.tripKey),
          ));
        },
      ),
      floatingActionButton: _fabList(),
    );
  }

  _popupMenuButtonEvent(String value) {
    print('PopupMenuItem Selected: $value');
    if (value == 'End Trip') {
      _activeTrip?.save();
      tripList.delete('active_trip');
      tripList.add(_activeTrip ?? TripRecord());
      _activeTrip = null;
      Navigator.pop(context);
    }
  }

  List<Widget> _popupMenuActions() {
    if (widget.tripKey != 'active_trip') return [];
    return [
      PopupMenuButton<String>(
        onSelected: (value) => _popupMenuButtonEvent(value),
        itemBuilder: (BuildContext context) {
          return {'Edit Entry', 'End Trip'}.map((String choice) {
            return PopupMenuItem<String>(
              value: choice,
              child: Text(choice),
            );
          }).toList();
        },
      ),
    ];
  }

  Widget? _fabList() {
    if (widget.tripKey != 'active_trip') return null;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          heroTag: null,
          backgroundColor: Colors.red,
          onPressed: () {
            showSubstanceReportDialog(context);
          },
          child: Icon(Icons.science_outlined),
          tooltip: 'Log Substance',
        ),
        SizedBox(
          height: 15.0,
        ),
        FloatingActionButton(
          heroTag: null,
          backgroundColor: Colors.red,
          onPressed: () {
            showNoteDialog(context);
          },
          child: Icon(Icons.note_alt_outlined),
          tooltip: 'Log Note',
        ),
      ],
    );
  }
}
