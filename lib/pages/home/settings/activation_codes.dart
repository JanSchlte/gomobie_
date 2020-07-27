import 'package:flutter/material.dart';

class ActivationCodes extends StatelessWidget {
  static const routeName = '/settings/activation';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Aktivierungscodes',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              'assets/general_assets/keys.png',
              width: 200,
            ),
            Text(
              'Dieses Feature ist bald verfügbar',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
