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
                    SimpleAutocompleteFormField<String>(
                      minSearchLength: 1,
                      maxSuggestions: 3,
                      controller: _substanceTextController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('Substance Name'),
                      ),
                      itemBuilder: (BuildContext context, item) => Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(item!),
                      ),
                      onSearch: (String search) async => search.isEmpty
                          ? SUBSTANCES
                          : SUBSTANCES
                              .where((_sub) => _sub
                                  .toLowerCase()
                                  .contains(search.toLowerCase()))
                              .toList(),
                      itemFromString: (string) => SUBSTANCES.singleWhere(
                          (_sub) => _sub == string.toLowerCase(),
                          orElse: () => string),
                      itemToString: (_item) {
                        print('itemToString: $_item');
                        return _item ?? '';
                      },
                      onChanged: (value) {
                        print('onChanged: $value');
                        _substanceTextController.text = value ?? '';
                      },
                      onSaved: (value) {
                        _substanceTextController.text = value ?? '';
                      },
                      validator: (value) {
                        return value?.isNotEmpty ?? false
                            ? null
                            : 'Substance name required';
                      },
                    ),
                    // TextFormField(
                    //   controller: _substanceTextController,
                    // validator: (value) {
                    //   return value!.isNotEmpty
                    //       ? null
                    //       : 'Substance name required';
                    // },
                    //   decoration: InputDecoration(
                    //     border: OutlineInputBorder(),
                    //     label: Text('Substance Name'),
                    //   ),
                    // ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: _doseTextController,
                      validator: (value) {
                        return value!.isNotEmpty ? null : 'Dosage required';
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('Dose Taken'),
                      ),
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
                        return value!.isNotEmpty
                            ? null
                            : 'Notes must include notes.';
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('Log Note'),
                      ),
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

Future<void> showArchiveLongPressDialog(
  BuildContext context, {
  TripRecord? selectedLog,
}) async {
  return showDialog(
      context: context,
      builder: (context) =>
          SimpleDialog(title: Text('Manage Triplog'), children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => TripLogPage(
                          context,
                          tripKey: selectedLog?.key,
                        )));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    child: Icon(Icons.view_carousel),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text('View Triplog'),
                  SizedBox(
                    width: 15,
                  ),
                ],
              ),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.of(context).pop();
                showConfirmationDialog(context, callback: () {
                  Navigator.of(context).pop();
                  tripList.delete(selectedLog?.key);
                }, action: 'delete this Triplog');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    child: Icon(Icons.delete_forever),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text('Delete Triplog'),
                  SizedBox(
                    width: 5,
                  ),
                ],
              ),
            ),
          ]));
}

Future<void> showConfirmationDialog(BuildContext context,
    {dynamic callback, String action = 'end the active trip'}) {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Are you sure?'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[Text('Are you sure you want to $action?')],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: callback,
            child: Text('Confirm'),
          ),
        ],
      );
    },
  );
}
