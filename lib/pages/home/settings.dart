import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 8),
        ListTile(
          title: Text('Profil'),
          trailing: Icon(Icons.arrow_forward),
        ),
        Divider(),
        ListTile(
          title: Text('Bezahlkonten'),
          trailing: Icon(Icons.arrow_forward),
        ),
        Divider(),
        ListTile(
          title: Text('Geschäftskonto eröffnen'),
          trailing: Icon(Icons.arrow_forward),
        ),
        Divider(),
        ListTile(
          title: Text('Hilfe'),
          trailing: Icon(Icons.arrow_forward),
        ),
        Divider(),
        ListTile(
          title: Text('Aktivierungscodes'),
          trailing: Icon(Icons.arrow_forward),
        ),
        Divider(),
      ],
    );
  }
}
