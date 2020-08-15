import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class Help extends StatelessWidget {
  static const routeName = '/settings/help';
  String mail = 'support@gomobie.de';

  @override
  _writeMail() async {
    if (await canLaunch('mailto:$mail')) {
      await launch('mailto:$mail');
    } else {
      throw 'Could not launch $mail';
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'HILFE',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 30),
            Text(
              'Schreiben Sie uns gerne eine Mail, sofern Sie Fragen, Wünsche oder Probleme mit unserer App haben.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 10),
              child: RaisedButton(
                onPressed: () {
                  _writeMail();
                },
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Text(
                      'support@gomobie.de',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                    Expanded(
                      child: Container(),
                    ),
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
            SizedBox(height: 40),
            Text(
              'Wir melden uns so schnell wie möglich bei Ihnen.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
