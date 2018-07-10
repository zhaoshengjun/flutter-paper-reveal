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
  int activeIndex = 0;
  SlideDirection slideDirection = SlideDirection.none;
  double slidePercent = 0.0;

  _MyHomePageState() {
    slideUpdateStream = new StreamController<SlideUpdate>();
    slideUpdateStream.stream.listen((SlideUpdate event) {
      setState(() {
        if (event.updateType == UpdateType.dragging) {
          slideDirection = event.direction;
          slidePercent = event.slidePercent;
        } else if (event.updateType == UpdateType.doneDragging) {
          if (slidePercent > 0.5) {
            activeIndex = slideDirection == SlideDirection.leftToRight
                ? activeIndex - 1
                : activeIndex + 1;
          }
          slideDirection = event.direction;
          slidePercent = event.slidePercent;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Stack(
      children: [
        new Page(
          viewModel: pages[activeIndex],
          percentVisible: 1.0,
        ),
        new PageReveal(
            revealPercent: slidePercent,
            child: new Page(
              viewModel: pages[1],
              percentVisible: slidePercent,
            )),
        new PagerIndicator(
          viewModel: new PagerIndicatorViewModel(
              pages: pages,
              activeIndex: activeIndex,
              slideDirection: slideDirection,
              slidePercent: slidePercent),
        ),
        new PageDragger(slideUpdateStream: this.slideUpdateStream),
      ],
    ));
  }
}
