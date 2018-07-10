import 'dart:ui';

import 'package:flutter/material.dart';
import 'pages.dart';

class PagerIndicator extends StatelessWidget {
  final PagerIndicatorViewModel viewModel;

  PagerIndicator({this.viewModel});

  @override
  Widget build(BuildContext context) {
    List<PageBubble> bubbles = [];
    for (var i = 0; i < viewModel.pages.length; ++i) {
      final page = viewModel.pages[i];

      var percentActive;
      if (i == viewModel.activeIndex) {
        percentActive = 1 - viewModel.slidePercent;
      } else if (i == viewModel.activeIndex - 1 &&
          viewModel.slideDirection == SlideDirection.leftToRight) {
        percentActive = viewModel.slidePercent;
      } else if (i == viewModel.activeIndex + 1 &&
          viewModel.slideDirection == SlideDirection.rightToLeft) {
        percentActive = viewModel.slidePercent;
      } else {
        percentActive = 0.0;
      }

      bubbles.add(new PageBubble(
          viewModel: new PageBubbleViewModel(
              iconAssetPath: page.iconAssetIcon,
              color: page.color,
              isHollow: i > viewModel.activeIndex ||
                  (i == viewModel.activeIndex &&
                      viewModel.slideDirection == SlideDirection.leftToRight),
              activePercent: percentActive)));
    }
    return new Column(
      children: [
        new Expanded(child: new Container()),
        new Transform(
          transform: new Matrix4.translationValues(-50.0, 0.0, 0.0),
          child: new Row(
              mainAxisAlignment: MainAxisAlignment.center, children: bubbles),
        ),
      ],
    );
  }
}

class PageBubble extends StatelessWidget {
  final PageBubbleViewModel viewModel;

  PageBubble({this.viewModel});

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(10.0),
      child: new Container(
        width: lerpDouble(20.0, 45.0, viewModel.activePercent),
        height: lerpDouble(20.0, 45.0, viewModel.activePercent),
        decoration: new BoxDecoration(
            shape: BoxShape.circle,
            color: viewModel.isHollow
                ? const Color(0x88FFFFFF)
                    .withAlpha(0x88 * viewModel.activePercent.round())
                : const Color(0x88FFFFFF),
            border: new Border.all(
                color: viewModel.isHollow
                    ? const Color(0x88FFFFFF)
                        .withAlpha(0x88 * (1 - viewModel.activePercent).round())
                    : Colors.transparent)),
        child: new Opacity(
          opacity: viewModel.activePercent,
          child: new Image.asset(
            viewModel.iconAssetPath,
            color: viewModel.color,
          ),
        ),
      ),
    );
  }
}

enum SlideDirection { leftToRight, rightToLeft }

class PagerIndicatorViewModel {
  final List<PageViewModel> pages;
  final int activeIndex;
  final SlideDirection slideDirection;
  final double slidePercent;

  PagerIndicatorViewModel(
      {this.pages, this.activeIndex, this.slideDirection, this.slidePercent});
}

class PageBubbleViewModel {
  final String iconAssetPath;
  final Color color;
  final bool isHollow;
  final double activePercent;

  PageBubbleViewModel(
      {this.iconAssetPath, this.color, this.isHollow, this.activePercent});
}
