part of '../main.dart';

final DateFormat formatter = DateFormat('EEE, MMM d, y @ H:m');

ListTile _substanceTile({
  String? substance,
  String? dose,
  String? timestamp,
  String tripKey = 'active_trip',
}) {
  DateTime _first = tripList
              .get(tripKey == 'active_trip' ? tripKey : int.parse(tripKey))!
              .substances
              .length >
          0
      ? DateTime.parse(tripList
              .get(tripKey == 'active_trip' ? tripKey : int.parse(tripKey))!
              .substances
              .first
              .timestamp ??
          '')
      : DateTime.now();
  DateTime _current = DateTime.parse(timestamp ?? '');
  Duration _difference = _current.difference(_first);
  String _ts = _difference == Duration.zero
      ? '\nTime T=0 @ ' + formatter.format(DateTime.parse(timestamp ?? ''))
      : '\nT ${_difference.isNegative ? '-' : '+'} ' +
          '${(_difference.abs().inHours > 0) ? _difference.inHours.toString() + 'hr : ' : ''}' +
          '${(_difference.abs().inMinutes % 60).toString().padLeft(2, '0')}min' +
          ' : ${(_difference.abs().inSeconds % 60).toString().padLeft(2, '0')}sec';
  return ListTile(
    leading: CircleAvatar(
      child: Icon(Icons.science_outlined),
    ),
    title: Text(substance ?? 'NullName'),
    subtitle: Text('$dose taken, $_ts'),
  );
}

ListTile _noteTile({
  String? note,
  String? timestamp,
  String tripKey = 'active_trip',
  BuildContext? context,
}) {
  DateTime _first = tripList
              .get(tripKey == 'active_trip' ? tripKey : int.parse(tripKey))!
              .substances
              .length >
          0
      ? DateTime.parse(tripList
              .get(tripKey == 'active_trip' ? tripKey : int.parse(tripKey))!
              .substances
              .first
              .timestamp ??
          '')
      : DateTime.now();
  DateTime _current = DateTime.parse(timestamp ?? '');
  Duration _difference = _current.difference(_first);
  String _ts = 'T ${_difference.isNegative ? '-' : '+'} ' +
      '${(_difference.abs().inHours > 0) ? _difference.inHours.toString() + 'hr : ' : ''}' +
      '${(_difference.abs().inMinutes % 60).toString().padLeft(2, '0')}min' +
      ' : ${(_difference.abs().inSeconds % 60).toString().padLeft(2, '0')}sec';

  return ListTile(
    leading: CircleAvatar(
      child: Icon(Icons.note_alt_outlined),
    ),
    title: Text(note ?? 'NullNote'),
    subtitle: Text(_ts),
  );
}

List<ListTile> _nullReturn() {
  return [
    ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.black,
        child: Icon(Icons.flight_takeoff),
      ),
      title: Text(
        'No Active Triplog',
        textAlign: TextAlign.center,
      ),
      subtitle: Text(
        'Log a note or substance to begin.',
        textAlign: TextAlign.center,
      ),
      trailing: CircleAvatar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.black,
        child: Icon(Icons.flight_takeoff),
      ),
    ),
    ListTile(
      title: Text(
        'You are cleared for takeoff!',
        textAlign: TextAlign.center,
      ),
    )
  ];
}

List<ListTile> _renderList({
  key: 'active_trip',
}) {
  List<ListTile> listOfTiles = [];

  TripRecord? _trip = tripList.get(key);

  if (_trip == null) {
    return _nullReturn();
  }

  Iterator<Substance> si = _trip.substances.iterator;
  Iterator<Note> ni = _trip.notes.iterator;
  bool si_iter = si.moveNext();
  bool ni_iter = ni.moveNext();
  do {
    var si_ts = (si_iter)
        ? (DateTime.parse(si.current.timestamp ?? ''))
        : DateTime.now();
    var ni_ts = (ni_iter)
        ? (DateTime.parse(ni.current.timestamp ?? ''))
        : DateTime.now();

    if (si_iter || ni_iter) {
      var diff = si_ts.difference(ni_ts);
      if (diff < Duration.zero) {
        if (si_iter) {
          listOfTiles.add(_substanceTile(
            substance: si.current.name,
            dose: si.current.doseGrade,
            timestamp: si.current.timestamp,
            tripKey: key.toString(),
          ));
          si_iter = si.moveNext();
        }
      } else if (diff > Duration.zero) {
        if (ni_iter) {
          listOfTiles.add(_noteTile(
            note: ni.current.note,
            timestamp: ni.current.timestamp,
            tripKey: key.toString(),
          ));
          ni_iter = ni.moveNext();
        }
      } else if (diff == Duration.zero) {
        if (si_iter) {
          listOfTiles.add(_substanceTile(
            substance: si.current.name,
            dose: si.current.doseGrade,
            timestamp: si.current.timestamp,
            tripKey: key.toString(),
          ));
          si_iter = si.moveNext();
        }

        if (ni_iter) {
          listOfTiles.add(_noteTile(
            note: ni.current.note,
            timestamp: ni.current.timestamp,
            tripKey: key.toString(),
          ));
          ni_iter = ni.moveNext();
        }
      } else {
        throw ErrorDescription('Unpredicted value for diff...');
      }
    }
  } while (si_iter || ni_iter);

  return listOfTiles.isNotEmpty ? listOfTiles : _nullReturn();
}
