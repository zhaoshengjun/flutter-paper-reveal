import 'package:flutter/material.dart';
import 'pager_indicator.dart';

class PageDragger extends StatefulWidget {
  @override
  _PageDraggerState createState() => new _PageDraggerState();
}

class _PageDraggerState extends State<PageDragger> {
  static const FULL_TRANSITION_PX = 300;
  Offset dragStart;
  SlideDirection slideDirection;
  double slidePercent = 0.0;
  onDragStart(DragStartDetails details) {
    dragStart = details.globalPosition;
  }

  onDragUpdate(DragUpdateDetails details) {
    if (dragStart != null) {
      final newPosition = details.globalPosition;
      final offsetX = dragStart.dx - newPosition.dx;
      if (offsetX > 0.0) {
        slideDirection = SlideDirection.rightToLeft;
      } else if (offsetX < 0.0) {
        slideDirection = SlideDirection.leftToRight;
      } else {
        slideDirection = SlideDirection.none;
      }

      slidePercent = (offsetX / FULL_TRANSITION_PX).abs().clamp(0.0, 1.0);
      print('Dragging $slideDirection at $slidePercent%');
    }
  }

  onDragEnd(DragEndDetails details) {
    dragStart = null;
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onHorizontalDragStart: onDragStart,
      onHorizontalDragUpdate: onDragUpdate,
      onHorizontalDragEnd: onDragEnd,
    );
  }
}
