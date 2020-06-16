import 'package:flutter/material.dart';

import 'home/overview.dart';

class Home extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 2;

  final List<Widget> _pages = [
    Overview(),
    Overview(),
    Overview(),
    Overview(),
    Overview(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
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
    );
  }
}
