import 'package:flutter/material.dart';
import 'package:gomobie/pages/intro_screen/first_screen.dart';

enum IntroScreenProgress { first, second, third }

class IntroScreen extends StatefulWidget {
  IntroScreen({Key key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  double _currentPage = 0;
  final PageController _controller = PageController(viewportFraction: 0.99);

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page;
      });
    });
  }

  Widget _buildPageIndicator() {
    return SizedBox(
      width: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _singleIndicator(_currentPage < 1 ? true : false),
          _singleIndicator(
              _currentPage < 2 && _currentPage >= 1 ? true : false),
          _singleIndicator(
              _currentPage < 3 && _currentPage >= 2 ? true : false),
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

  static Widget _buildLoads(String first, String last) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: first,
        style: TextStyle(fontSize: 23, color: Color(0xFF1ABC9C)),
        children: [
          TextSpan(
            text: last,
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey,
              height: 2,
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildBulletPoint(String first, String last) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: first,
        style: TextStyle(
          fontSize: 15,
          color: Colors.grey,
          height: 1.2,
        ),
        children: [
          TextSpan(
            text: last,
            style: TextStyle(fontSize: 23, color: Color(0xFF1ABC9C)),
          ),
        ],
      ),
    );
  }

  final List<Widget> _screens = [
    FirstScreen(
      imageAsset: 'assets/intro_screens/intro_screen_1.png',
      text: <Widget>[
        _buildLoads(
            '95%',
            ' aller Teenager besitzen ein\n'
                'Smartphone, aber fast niemand\n'
                'von ihnen kann selbst online bezahlen')
      ],
    ),
    FirstScreen(
      imageAsset: 'assets/intro_screens/intro_screen_2.png',
      text: <Widget>[
        _buildLoads(
            'Gomobie',
            ' macht es möglich,\n'
                'dass Kinder und Jugendliche unabhängig\n'
                'und sicher im Internet einkaufen können')
      ],
    ),
    FirstScreen(
      imageAsset: 'assets/intro_screens/intro_screen_3.png',
      text: <Widget>[
        _buildBulletPoint('Umfassende Einstellungen für\n', 'Eltern'),
        SizedBox(height: 10),
        _buildBulletPoint(
            'Angepasst auf spezielle'
                ' Bedürfnisse\nund Wünsche der\n',
            'Kinder'),
        SizedBox(height: 10),
        _buildBulletPoint('Kostenloser\n', 'Schutz')
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemBuilder: (context, index) => _screens[index],
                  itemCount: _screens.length,
                ),
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
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn);
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
      ),
    );
  }
}
