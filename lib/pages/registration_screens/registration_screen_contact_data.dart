import 'package:flutter/material.dart';

import '../../util/routes/registration_screen_contact_args.dart';

class RegistrationScreenContactData extends StatelessWidget {
  static const routeName = '/register/contact';

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context).settings.arguments
        as RegistrationScreenContactArguments;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30.0,
              ),
              Image.asset(
                  'assets/registration_screens/registration_head.png'),
              SizedBox(height: 30.0),
              Text(
                'Optionale Daten',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      elevation: 0,
                      shape: RoundedRectangleBorder(),
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'Zurück',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      textColor: Colors.grey,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: RaisedButton(
                      onPressed: () {},
                      elevation: 0,
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'Weiter',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      textColor: Colors.white,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
