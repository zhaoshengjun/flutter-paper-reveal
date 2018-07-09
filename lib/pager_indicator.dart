import 'dart:ui';

import 'package:flutter/material.dart';
import 'pages.dart';

class PagerIndicator extends StatelessWidget {
  final PagerIndicatorViewModel viewModel;

  PagerIndicator({this.viewModel});

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: [
        new Expanded(child: new Container()),
        new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new PageBubble(
              viewModel: new PageBubbleViewModel(
                  iconAssetPath: 'assets/shopping_cart.png',
                  color: Colors.green,
                  isHollow: true,
                  activePercent: 0.0),
            ),
            new PageBubble(
              viewModel: new PageBubbleViewModel(
                  iconAssetPath: 'assets/shopping_cart.png',
                  color: Colors.green,
                  isHollow: false,
                  activePercent: 1.0),
            ),
            new PageBubble(
              viewModel: new PageBubbleViewModel(
                  iconAssetPath: 'assets/shopping_cart.png',
                  color: Colors.green,
                  isHollow: true,
                  activePercent: 0.0),
            )
          ],
        )
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
                ? Colors.transparent
                : const Color(0x88FFFFFF),
            border: new Border.all(
                color: viewModel.isHollow
                    ? const Color(0x88FFFFFF)
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
