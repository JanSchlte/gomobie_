import 'package:flutter/material.dart';

enum IntroScreenProgress { first, second, third }

class IntroScreen extends StatefulWidget {
  IntroScreen({Key key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  IntroScreenProgress _progress = IntroScreenProgress.first;

  Widget _buildPageIndicator() {
    return Row(
      children: <Widget>[

      ],
    );
  }

  Widget _singleIndicator(bool active) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(active ? 0xFF1ABC9C : 0xFF25C6A6),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Image.asset('assets/intro_screens/intro_screen_1.png'),
              SizedBox(height: 30),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: '95%',
                  style: TextStyle(fontSize: 23, color: Color(0xFF1ABC9C)),
                  children: [
                    TextSpan(
                      text: ' aller Teenager besitzen ein\n'
                          'Smartphone, aber fast niemand\n'
                          'von ihnen kann selbst online bezahlen',
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
          ),
        ),
      ),
    );
  }
}
