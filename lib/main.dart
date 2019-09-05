import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _people = 0;

  void _incrementPeople() {
    setState(() {
      _people++;
    });
  }

  void _decrementPeople() {
    if (_people == 0) return;

    setState(() {
      _people--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Colors.purple,
        ),
        body: Stack(
          children: <Widget>[
            Image.asset(
              'images/restaurant.png',
              fit: BoxFit.cover,
              height: 1000.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'There are $_people',
                      style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: FlatButton(
                        child: Text(
                          '+1',
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          _incrementPeople();
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: FlatButton(
                        child: Text(
                          '-1',
                          style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              backgroundColor: Colors.transparent),
                        ),
                        onPressed: () {
                          _decrementPeople();
                        },
                      ),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                        _people > 10
                            ? 'Restaurant is full. Leave now!'
                            : 'Please, enter.',
                        style: TextStyle(
                            fontSize: 17.0, fontWeight: FontWeight.bold))
                  ],
                )
              ],
            )
          ],
        ));
  }
}