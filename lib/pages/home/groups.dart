import 'package:flutter/material.dart';

class CollectionGroups extends StatelessWidget {
  static const routeName = '/groups';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      body: Align(
        alignment: Alignment(0.9, 0.9),
        child: FloatingActionButton(
          elevation: 10,
          backgroundColor: Color(0xFF1ABC9C),
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            //Diese Funktionalität soll noch nicht in dem MVP enthalten sein
          },
        ),
      ),
    );
  }
}
