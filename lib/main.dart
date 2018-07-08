import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Stack(
      children: <Widget>[
        new Container(
          width: double.INFINITY,
          color: Colors.blue,
          child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new Padding(
                  padding: new EdgeInsets.only(bottom: 25.0),
                  child: new Image.asset(
                    'assets/hotels.png',
                    width: 200.0,
                    height: 200.0,
                  ),
                ),
                new Padding(
                    padding: new EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: new Text(
                      'Hotels',
                      style: new TextStyle(color: Colors.white, fontSize: 34.0),
                    )),
                new Padding(
                  padding: new EdgeInsets.only(bottom: 75.0),
                  child: new Text(
                    'This is a body text',
                    textAlign: TextAlign.center,
                    style: new TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                )
              ]),
        )
      ],
    ));
  }
}
