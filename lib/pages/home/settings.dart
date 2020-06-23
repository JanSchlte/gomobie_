import 'package:flutter/material.dart';
import 'package:gomobie/pages/home/settings/activation_codes.dart';
import 'package:gomobie/pages/home/settings/help.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'EINSTELLUNGEN',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
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
            onTap: () => Navigator.of(context).pushNamed(Help.routeName),
          ),
          Divider(),
          ListTile(
            title: Text('Aktivierungscodes'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () =>
                Navigator.of(context).pushNamed(ActivationCodes.routeName),
          ),
          Divider(),
        ],
      ),
    );
  }
}
