import 'package:flutter/material.dart';
import 'package:beacon_broadcast/beacon_broadcast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  BeaconBroadcast beaconBroadcast = BeaconBroadcast();
  bool isStating = false;
  void _beaconStart() {
    if (isStating) {
      beaconBroadcast.stop().then((_) {
        isStating = !isStating;
        setState(() {});
      });
    } else {
      beaconBroadcast
          .setIdentifier("Test")
          .setUUID('39ED98FF-2900-441A-802F-9C398FC199D2')
          .setMajorId(1)
          .setMinorId(100)
          .start()
          .then((_) {
        isStating = !isStating;
        setState(() {});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$isStating',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _beaconStart,
        tooltip: 'Beacon Start',
        child: Icon(Icons.add),
      ),
    );
  }
}
