import 'package:flutter/material.dart';
import 'package:gomobie/pages/home/actions/create_groups.dart';

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
        heroTag: 'floating',
        elevation: 5,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed(
            CreateGroup.routeName,
          );
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
