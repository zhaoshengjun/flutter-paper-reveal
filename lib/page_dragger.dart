import 'package:flutter/material.dart';

class PageDragger extends StatefulWidget {
  @override
  _PageDraggerState createState() => new _PageDraggerState();
}

class _PageDraggerState extends State<PageDragger> {
  onDragStart(DragStartDetails details) {}

  onDragUpdate(DragUpdateDetails details) {}

  onDragEnd(DragEndDetails details) {}

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onHorizontalDragStart: onDragStart,
      onHorizontalDragUpdate: onDragUpdate,
      onHorizontalDragEnd: onDragEnd,
    );
  }
}
