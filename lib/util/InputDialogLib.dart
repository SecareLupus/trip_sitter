part of '../main.dart';

Future<void> showSubstanceReportDialog(BuildContext context) async {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  return await showDialog(
      context: context,
      builder: (context) {
        final TextEditingController _substanceTextController =
                TextEditingController(),
            _doseTextController = TextEditingController();
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            content: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: _substanceTextController,
                      validator: (value) {
                        return value!.isNotEmpty
                            ? null
                            : 'Substance name required';
                      },
                      decoration: InputDecoration(hintText: 'Substance Name'),
                    ),
                    TextFormField(
                      controller: _doseTextController,
                      validator: (value) {
                        return value!.isNotEmpty ? null : 'Dosage required';
                      },
                      decoration: InputDecoration(hintText: 'Dose Taken'),
                    ),
                  ],
                )),
            actions: <Widget>[
              TextButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('Okay'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _activeTrip = _activeTrip ?? TripRecord();
                    if (!_activeTrip!.isInBox)
                      tripList.put('active_trip', _activeTrip!);
                    var _newSubstance = Substance()
                      ..name = _substanceTextController.text
                      ..doseGrade = _doseTextController.text
                      ..timestamp = DateTime.now().toString();
                    substanceList.add(_newSubstance);
                    _activeTrip!.substances.add(_newSubstance);
                    _activeTrip!.save();
                    Navigator.of(context).pop();
                  }
                },
              ),
            ],
          );
        });
      });
}

Future<void> showNoteDialog(BuildContext context) async {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  return await showDialog(
      context: context,
      builder: (context) {
        final TextEditingController _noteTextController =
            TextEditingController();
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            content: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: _noteTextController,
                      validator: (value) {
                        return value!.isNotEmpty ? null : '';
                      },
                      decoration: InputDecoration(hintText: 'Log Note'),
                    ),
                  ],
                )),
            actions: <Widget>[
              TextButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('Okay'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _activeTrip = _activeTrip ?? TripRecord();
                    if (!_activeTrip!.isInBox)
                      tripList.put('active_trip', _activeTrip!);
                    var _newNote = Note()
                      ..note = _noteTextController.text
                      ..timestamp = DateTime.now().toString();
                    noteList.add(_newNote);
                    _activeTrip!.notes.add(_newNote);
                    _activeTrip!.save();
                    Navigator.of(context).pop();
                  }
                },
              ),
            ],
          );
        });
      });
}
