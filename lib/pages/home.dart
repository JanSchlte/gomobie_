import 'package:flutter/material.dart';
import 'package:gomobie/pages/home/transactions.dart';

import 'home/overview.dart';
import 'home/settings.dart';

class Home extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 2;

  final List<Widget> _pages = [
    Overview(),
    Transactions(),
    Overview(),
    Overview(),
    Settings(),
  ];

  final List<PreferredSizeWidget> _appBars = [
    null,
    null,
    null,
    null,
    AppBar(
      centerTitle: true,
      title: Text(
        'Einstellungen',
        style: TextStyle(color: Colors.white),
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4C4C4C),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.people_outline), title: Container()),
          BottomNavigationBarItem(
              icon: Icon(Icons.storage), title: Container()),
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Container()),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervisor_account), title: Container()),
          BottomNavigationBarItem(icon: Icon(Icons.menu), title: Container()),
        ],
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
      body: _pages.elementAt(_currentIndex),
      appBar: _appBars.elementAt(_currentIndex),
    );
  }
}
