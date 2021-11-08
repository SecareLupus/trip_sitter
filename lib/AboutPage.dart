part of 'main.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  static const String _title = 'About TripSitter';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(_title),
      ),
      body: Center(
        child: Container(
          width: 600.0,
          height: 200.0,
          child: Column(
            children: [
              Text(
                'TripSitter is an Open Source Harm Reduction Tool, providing a way for' +
                    ' users of drugs to record what they have taken and their experiences.',
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                'In the event of a problem, your list of substances and notes could ' +
                    'provide others with the information they need to help you through ' +
                    'the experience, either medically or introspectively.',
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                'The creators of TripSitter do not advocate the use or abuse of' +
                    ' drugs; this tool is provided for Harm Reduction with the' +
                    ' goal of helping people stay safe.',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(color: Colors.red),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                '<3 Please Use Responsibly, You Are Loved <3',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(color: Colors.red),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'source',
            onPressed: () {},
            backgroundColor: Colors.red,
            tooltip: 'View Source',
            child: Icon(Icons.code),
          ),
          SizedBox(
            height: 25.0,
          ),
          FloatingActionButton(
            heroTag: 'donate',
            onPressed: () {},
            backgroundColor: Colors.red,
            tooltip: 'Buy us a coffee',
            child: Icon(Icons.coffee_sharp),
          ),
        ],
      ),
    );
  }
}
