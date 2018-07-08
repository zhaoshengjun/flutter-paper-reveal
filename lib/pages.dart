import 'package:flutter/material.dart';

class Page extends StatelessWidget {
  final PageViewModel viewModel;

  Page({this.viewModel});

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: double.INFINITY,
      color: viewModel.color,
      child: new Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        new Padding(
          padding: new EdgeInsets.only(bottom: 25.0),
          child: new Image.asset(
            viewModel.heroAssetPath,
            width: 200.0,
            height: 200.0,
          ),
        ),
        new Padding(
            padding: new EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: new Text(
              viewModel.title,
              style: new TextStyle(color: Colors.white, fontSize: 34.0),
            )),
        new Padding(
          padding: new EdgeInsets.only(bottom: 75.0),
          child: new Text(
            viewModel.body,
            textAlign: TextAlign.center,
            style: new TextStyle(color: Colors.white, fontSize: 18.0),
          ),
        )
      ]),
    );
  }
}

class PageViewModel {
  final Color color;
  final String heroAssetPath;
  final String title;
  final String body;
  final String iconAssetIcon;

  PageViewModel(this.color, this.heroAssetPath, this.title, this.body,
      this.iconAssetIcon);
}
