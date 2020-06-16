import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/backgrounds/skyscrapers.jpg'),
              fit: BoxFit.fill)),
      child: Material(
        color: Colors.grey.shade800.withOpacity(0.75),
        child: SafeArea(
          child: Center(),
        ),
      ),
    );
  }
}
