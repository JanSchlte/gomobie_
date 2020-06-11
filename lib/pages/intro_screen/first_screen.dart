import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  final String imageAsset;
  final String firstText;
  final String lastText;

  const FirstScreen({Key key, this.imageAsset, this.firstText, this.lastText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset(imageAsset),
        SizedBox(height: 30),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: firstText,
            style: TextStyle(fontSize: 23, color: Color(0xFF1ABC9C)),
            children: [
              TextSpan(
                text: lastText,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  height: 2,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
