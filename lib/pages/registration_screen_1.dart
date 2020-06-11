import 'package:flutter/material.dart';

class RegistrationScreenOne extends StatefulWidget {
  static const routeName = '/register';

  @override
  _RegistrationScreenOneState createState() => _RegistrationScreenOneState();
}

class _RegistrationScreenOneState extends State<RegistrationScreenOne> {
  //TODO: Move into provider
  String country = '';
  String title = '';
  DateTime birthday;
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
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
                        'Persönliche Daten',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 48.0,
                      ),
                      Form(
                        key: _formKey,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text(
                                    'Land',
                                    style: TextStyle(
                                        color: Colors.grey.shade500,
                                        fontSize: 15.0),
                                  ),
                                  Expanded(child: Container()),
                                  DropdownButton<String>(
                                    style: TextStyle(fontSize: 15.0),
                                    hint: country == ''
                                        ? Text('Auswählen')
                                        : Text(country),
                                    items: <String>['Deutschland', 'Österreich']
                                        .map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (String newValue) {
                                      setState(() {
                                        country = newValue;
                                      });
                                    },
                                  )
                                ],
                              ),
                              Divider(thickness: 1),
                              Row(
                                children: <Widget>[
                                  Text(
                                    'Anrede',
                                    style: TextStyle(
                                        color: Colors.grey.shade500,
                                        fontSize: 15.0),
                                  ),
                                  Expanded(child: Container()),
                                  DropdownButton<String>(
                                    style: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontSize: 15,
                                    ),
                                    hint: title == ''
                                        ? Text('Auswählen')
                                        : Text(title),
                                    items: <String>['Herr', 'Frau', 'Andere']
                                        .map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (String newValue) {
                                      setState(() {
                                        title = newValue;
                                      });
                                    },
                                  )
                                ],
                              ),
                              Divider(thickness: 1),
                              TextFormField(
                                decoration: InputDecoration.collapsed(
                                    hintText: 'Vorname',
                                    hintStyle: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontSize: 15,
                                    )),
                                validator: (firstName) {
                                  if (firstName.trim().isEmpty) {
                                    return 'Dieses Feld kann nicht leer sein';
                                  }
                                  return null;
                                },
                              ),
                              Divider(thickness: 1),
                              TextFormField(
                                decoration: InputDecoration.collapsed(
                                    hintText: 'Nachname',
                                    hintStyle: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontSize: 15,
                                    )),
                                validator: (firstName) {
                                  if (firstName.trim().isEmpty) {
                                    return 'Dieses Feld kann nicht leer sein';
                                  }
                                  return null;
                                },
                              ),
                              Divider(thickness: 1),
                              Row(
                                children: <Widget>[
                                  Text(
                                    'Geburtstag',
                                    style: TextStyle(
                                        color: Colors.grey.shade500,
                                        fontSize: 15.0),
                                  ),
                                  Expanded(child: Container()),
                                  FlatButton(onPressed: () {}, child: Text(''))
                                ],
                              ),
                              Divider(thickness: 1),
                            ],
                          ),
                        ),
                      ),
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
