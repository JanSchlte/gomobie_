import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  final String imageAsset;
  final List<Widget> text;

  const FirstScreen({Key key, this.imageAsset, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset(imageAsset),
        SizedBox(height: 30),
        ...text
      ],
    );
  }
}
