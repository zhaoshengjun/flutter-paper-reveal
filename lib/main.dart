import 'package:flutter/material.dart';
import 'package:material_page_reveal/page_reveal.dart';
import 'pages.dart';

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
      children: [
        new Page(
          viewModel: pages[0],
          percentVisible: 1.0,
        ),
        new PageReveal(
            revealPercent: 1.0,
            child: new Page(
              viewModel: pages[1],
              percentVisible: 1.0,
            )),
        new Column(
          children: [
            new Expanded(child: new Container()),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: new Container(
                    width: 20.0,
                    height: 20.0,
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      border: new Border.all(
                          color: const Color(0x88FFFFFF), width: 3.0),
                    ),
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: new Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0x88FFFFFF),
                    ),
                    child: new Image.asset(
                      'assets/wallet.png',
                      color: Colors.blue,
                    ),
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: new Container(
                    width: 20.0,
                    height: 20.0,
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      border: new Border.all(
                          color: const Color(0x88FFFFFF), width: 3.0),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ],
    ));
  }
}
