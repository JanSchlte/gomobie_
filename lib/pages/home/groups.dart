import 'package:flutter/material.dart';

import '../../widgets/home/groups/collection_groups.dart';

class CollectionGroups extends StatelessWidget {
  static const routeName = '/groups';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 5,
        child: Icon(Icons.add),
        onPressed: () {
          //Diese Funktionalität soll noch nicht in dem MVP enthalten sein
        },
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            GroupCard(
                title: 'GEBURTSTAG LEON',
                money_available: 80.44,
                money_needed: 100.00),
            GroupCard(
                title: 'HOCHZEIT \n LUKAS UND LAURA',
                money_available: 50.22,
                money_needed: 250.00),
          ],
        ),
      ),
    );
  }
}
