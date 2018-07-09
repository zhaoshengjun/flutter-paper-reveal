import 'package:flutter/material.dart';
import 'pages.dart';

class PagerIndicator extends StatelessWidget {
  final PagerIndicatorViewModel viewModel;

  PagerIndicator({
    this.viewModel
  });

  @override
  Widget build(BuildContext context) {
    return new Column(
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
    );
  }
}

enum SlideDirection {
  leftToRight,
  rightToLeft
}

class PagerIndicatorViewModel {
  final List<PageViewModel> pages;
  final int activeIndex;
  final SlideDirection slideDirection;
  final double slidePercent;

  PagerIndicatorViewModel({
    this.pages,
    this.activeIndex,
    this.slideDirection,
    this.slidePercent
  });
}


class PagerBubbleViewModel {
  final String iconAssetPath;
  final Color color;
  final bool isHollow;
  final double activePercent;

  PagerBubbleViewModel({
    this.iconAssetPath,
    this.color,
    this.isHollow,
    this.activePercent
  })
}
