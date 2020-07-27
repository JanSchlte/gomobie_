import 'package:flutter/material.dart';
import 'package:gomobie/models/user_data.dart';

class ChildLimits extends StatelessWidget {
  final UserData childData;

  const ChildLimits({Key key, this.childData}) : super(key: key);

  Widget limitCard({String cardTitle, int value}) {
    return Card(
      child: Column(
        children: <Widget>[Text(cardTitle), Text('$value€')],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CircleAvatar(
          child: Icon(Icons.add),
        ),
        Text('${childData.name}'),
      ],
    );
  }
}
