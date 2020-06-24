import 'package:flutter/material.dart';
import 'package:gomobie/pages/home/family.dart';
import 'package:gomobie/pages/home/groups.dart';
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

  List<Widget> _pages;

  @override
  void initState() {
    _pages = [
      CollectionGroups(),
      Transactions(),
      Overview(changeIndex: () {
        setState(() {
          _currentIndex = 1;
        });
      }),
      Family(),
      Settings(),
    ];
    super.initState();
  }

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
