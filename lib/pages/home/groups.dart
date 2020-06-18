import 'package:flutter/material.dart';
import 'file:///D:/Business/Flutter/gomobie/lib/widgets/home/groups/collection_groups.dart';

class CollectionGroups extends StatelessWidget {
  static const routeName = '/groups';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          GroupCard('GEBURTSTAG LEON'),
          GroupCard('HOCHZEIT \n LUKAS UND LAURA'),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.87,
          ),
          //TODO: Align the add-Button to the bottom-right without the SizedBox
          Align(
            alignment: Alignment(0.87, 0),
            child: FloatingActionButton(
              elevation: 5,
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
        ],
      ),
    );
  }
}
