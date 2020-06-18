import 'package:flutter/material.dart';

class GroupCard extends StatelessWidget {
  final String title;

  GroupCard(this.title);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Text(title),
    );
  }
}
