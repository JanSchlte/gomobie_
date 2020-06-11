import 'package:flutter/material.dart';
import 'package:gomobie/pages/intro_screen/first_screen.dart';

enum IntroScreenProgress { first, second, third }

class IntroScreen extends StatefulWidget {
  IntroScreen({Key key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _controller = PageController(viewportFraction: 0.99);

  Widget _buildPageIndicator() {
    return SizedBox(
      width: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _singleIndicator(_controller.page < 1 ? true : false),
          _singleIndicator(_controller.page < 2 ? true : false),
          _singleIndicator(_controller.page < 3 ? true : false),
        ],
      ),
    );
  }

  Widget _singleIndicator(bool active) {
    return Container(
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: active ? Color(0xFF1ABC9C) : Color(0xFF1ABC9C).withOpacity(0.3),
      ),
    );
  }

  final List<Widget> _screens = [
    FirstScreen(
      imageAsset: 'assets/intro_screens/intro_screen_1.png',
      firstText: '95%',
      lastText: ' aller Teenager besitzen ein\n'
          'Smartphone, aber fast niemand\n'
          'von ihnen kann selbst online bezahlen',
    ),
    FirstScreen(
      imageAsset: 'assets/intro_screens/intro_screen_2.png',
      firstText: 'Gomobie',
      lastText: ' macht es möglich,\n'
          'dass Kinder und Jugendliche unabhängig\n'
          'und sicher im Internet einkaufen können',
    ),
    FirstScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            PageView(
              controller: _controller,
              children: _screens,
            ),
            SizedBox(
              height: 30,
            ),
            _buildPageIndicator(),
            SizedBox(
              height: 30,
            ),
            RaisedButton(
              onPressed: () {
                _controller.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeIn);
                setState(() {});
              },
              child: Text('WEITER'),
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
              elevation: 8,
              padding: EdgeInsets.symmetric(horizontal: 130, vertical: 20),
            ),
            SizedBox(
              height: 20,
            ),
            FlatButton(
              onPressed: () {},
              child: Text(
                'ÜBERSPRINGEN',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 17),
              ),
              padding: EdgeInsets.symmetric(horizontal: 90, vertical: 20),
            )
          ],
        ),
      ),
    );
  }
}
