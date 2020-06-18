import 'package:flutter/material.dart';
import 'package:gomobie/pages/home/transactions.dart';

class FamilyCard extends StatelessWidget {
  final String name;
  final AccountType type;

  const FamilyCard({Key key, this.name, this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        leading: CircleAvatar(
          child: Icon(Icons.add),
        ),
        title: Text(
          name,
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
        trailing: Text(
          type.message(),
          style: TextStyle(
            fontSize: 12,
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
