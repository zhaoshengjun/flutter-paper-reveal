import 'dart:async';

import 'package:flutter/material.dart';
import 'page_dragger.dart';
import 'page_reveal.dart';
import 'pager_indicator.dart';
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
  StreamController<SlideUpdate> slideUpdateStream;

  _MyHomePageState() {
    slideUpdateStream = new StreamController<SlideUpdate>();
  }

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
        new PagerIndicator(
          viewModel: new PagerIndicatorViewModel(
              pages: pages,
              activeIndex: 1,
              slideDirection: SlideDirection.leftToRight,
              slidePercent: 0.5),
        ),
        new PageDragger(slideUpdateStream: this.slideUpdateStream),
      ],
    ));
  }
}
