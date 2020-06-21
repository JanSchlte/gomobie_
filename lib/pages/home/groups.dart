import 'package:flutter/material.dart';

import '../../widgets/home/groups/collection_groups.dart';

class CollectionGroups extends StatelessWidget {
  static const routeName = '/groups';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'SAMMELGRUPPEN',
          style: TextStyle(color: Colors.white),
        ),
      ),
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
                moneyAvailable: 80.44,
                moneyNeeded: 100.00),
            GroupCard(
                title: 'HOCHZEIT \n LUKAS UND LAURA',
                moneyAvailable: 50.22,
                moneyNeeded: 250.00),
          ],
        ),
      ),
    );
  }
}
