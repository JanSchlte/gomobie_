import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import '../../util/routes/registration_screen_contact_args.dart';

class RegistrationScreenContactData extends StatefulWidget {
  static const routeName = '/register/contact';

  @override
  _RegistrationScreenContactDataState createState() =>
      _RegistrationScreenContactDataState();
}

class _RegistrationScreenContactDataState
    extends State<RegistrationScreenContactData> {
  bool _showPassword = false;

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
              Expanded(
                child: SingleChildScrollView(
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
                      Text(
                        'Können auch die des Enrziehungsberechtigten\n'
                        'entsprechen',
                        style: TextStyle(color: Colors.grey),
                        textAlign: TextAlign.center,
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
            ],
          ),
        ),
      ),
    );
  }
}
