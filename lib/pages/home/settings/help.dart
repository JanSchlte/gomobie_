import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Help extends StatelessWidget {
  static const routeName = '/settings/help';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Hilfe',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 30),
            Text(
              'Um ihnen immer die schnellste Hilfe anbieten zu können,\n'
              'haben sie mehrere Optionen zum Kontakt:',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            Row(
              children: [
                SizedBox(width: 20),
                Text('Sofortige Hilfe:'),
                Expanded(child: Container())
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: RaisedButton(
                onPressed: () {
                  //TODO: Alles für den support
                },
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Text('24/7 Chat Support',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18)),
                    Expanded(child: Container()),
                    Icon(Icons.arrow_forward),
                    SizedBox(width: 10),
                  ],
                ),
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
                elevation: 8,
                padding: EdgeInsets.symmetric(vertical: 20),
              ),
            ),
            SizedBox(height: 20),
            Text('Oder rufen Sie uns einfach an:'),
            SizedBox(height: 10),
            Text(
              '0800 646854684',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 20),
            Text('Wenn Ihre Angelegenheit auch von anderen Nutzern\n'
                'beantwortet werden kann, gehen Sie zu unserer\n'
                'Kunden-helfen-Kunden-Seite:'),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: RaisedButton(
                onPressed: () {
                  //TODO: https://pub.dev/packages/url_launcher
                },
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Text('https://forum.gomobie.de/faq',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18)),
                    Expanded(child: Container()),
                    Icon(Icons.arrow_forward),
                    SizedBox(width: 10),
                  ],
                ),
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
                elevation: 8,
                padding: EdgeInsets.symmetric(vertical: 20),
              ),
            ),
            SizedBox(height: 20),
            Text('Sie können auch unseren E-Mail Support kontaktieren:'),
            SizedBox(height: 10),
            Text(
              'support@gomobie.de',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
