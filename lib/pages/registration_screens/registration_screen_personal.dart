import 'package:flutter/material.dart';
import 'package:gomobie/pages/registration_screens/registration_screen_contact_data.dart';
import 'package:gomobie/util/routes/registration_screen_contact_args.dart';
import 'package:intl/intl.dart';

class RegistrationScreenOne extends StatefulWidget {
  static const routeName = '/register';

  @override
  _RegistrationScreenOneState createState() => _RegistrationScreenOneState();
}

class _RegistrationScreenOneState extends State<RegistrationScreenOne> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _postalCodeController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  String _country;
  String _title;
  DateTime _birthday;
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
                  child: Form(
                    key: _formKey,
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
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: <Widget>[
                              Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                elevation: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
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
                                            style: TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.grey.shade500,
                                            ),
                                            hint: _country == null
                                                ? Text('Auswählen')
                                                : Text(_country),
                                            items: <String>[
                                              'Deutschland',
                                              'Österreich'
                                            ].map((value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(
                                                  value,
                                                  style: TextStyle(
                                                    color: Colors.grey.shade500,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                              );
                                            }).toList(),
                                            onChanged: (newValue) {
                                              setState(() {
                                                _country = newValue;
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
                                            hint: _title == null
                                                ? Text('Auswählen')
                                                : Text(_title),
                                            items: <String>[
                                              'Herr',
                                              'Frau',
                                              'Andere'
                                            ].map((value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                            onChanged: (newValue) {
                                              setState(() {
                                                _title = newValue;
                                              });
                                            },
                                          )
                                        ],
                                      ),
                                      Divider(thickness: 1),
                                      TextFormField(
                                        decoration: InputDecoration(
                                            hintText: 'Vorname',
                                            hintStyle: TextStyle(
                                              color: Colors.grey.shade500,
                                              fontSize: 15,
                                            )),
                                        controller: _firstNameController,
                                        validator: (firstName) {
                                          if (firstName.trim().isEmpty) {
                                            return 'Dieses Feld kann nicht leer sein';
                                          }
                                          return null;
                                        },
                                      ),
                                      Divider(thickness: 1),
                                      TextFormField(
                                        decoration: InputDecoration(
                                            hintText: 'Nachname',
                                            hintStyle: TextStyle(
                                              color: Colors.grey.shade500,
                                              fontSize: 15,
                                            )),
                                        controller: _lastNameController,
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
                                          FlatButton(
                                            onPressed: () async {
                                              final birthday =
                                                  await showDatePicker(
                                                context: context,
                                                //TODO: This won't work with "Schaltjahre"
                                                initialDate: DateTime.now()
                                                    .subtract(Duration(
                                                        days: (365.25 * 18)
                                                            .ceil())),
                                                firstDate: DateTime.now()
                                                    .subtract(Duration(
                                                        days: (365.25 * 125)
                                                            .ceil())),
                                                lastDate: DateTime.now()
                                                    .subtract(Duration(
                                                        days: (365.25 * 18)
                                                            .ceil())),
                                              );
                                              setState(() {
                                                _birthday = birthday;
                                              });
                                            },
                                            child: Text(
                                              _birthday != null
                                                  ? '${DateFormat('dd.MM.yyyy').format(_birthday)}'
                                                  : 'Auswählen',
                                              style: TextStyle(
                                                  color: Colors.grey.shade500,
                                                  fontSize: 15.0),
                                            ),
                                          )
                                        ],
                                      ),
                                      Divider(thickness: 1),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                elevation: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    children: <Widget>[
                                      TextFormField(
                                        keyboardType: TextInputType.number,
                                        controller: _postalCodeController,
                                        decoration: InputDecoration(
                                            hintText: 'Postleitzahl',
                                            hintStyle: TextStyle(
                                              color: Colors.grey.shade500,
                                              fontSize: 15,
                                            )),
                                        validator: (postalCode) {
                                          final parsed =
                                              int.tryParse(postalCode);
                                          if (parsed == null ||
                                              parsed < 1067 && parsed > 99998) {
                                            return 'Diese Postleitzahl ist nicht valide';
                                          }
                                          return null;
                                        },
                                      ),
                                      Divider(thickness: 1),
                                      TextFormField(
                                        controller: _cityController,
                                        decoration: InputDecoration(
                                            hintText: 'Stadt',
                                            hintStyle: TextStyle(
                                              color: Colors.grey.shade500,
                                              fontSize: 15,
                                            )),
                                        validator: (city) {
                                          if (city.trim().isEmpty) {
                                            return 'Dieses Feld kann nicht leer sein';
                                          }
                                          return null;
                                        },
                                      ),
                                      Divider(thickness: 1),
                                      TextFormField(
                                        controller: _streetController,
                                        decoration: InputDecoration(
                                            hintText: 'Straße/Nr.',
                                            hintStyle: TextStyle(
                                              color: Colors.grey.shade500,
                                              fontSize: 15,
                                            )),
                                        validator: (street) {
                                          if (street.trim().isEmpty) {
                                            return 'Dieses Feld kann nicht leer sein';
                                          }
                                          return null;
                                        },
                                      ),
                                      Divider(thickness: 1),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
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
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                textColor: Colors.grey,
                                color: Colors.white,
                              ),
                            ),
                            Expanded(
                              child: RaisedButton(
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    Navigator.of(context).pushNamed(
                                      RegistrationScreenContactData.routeName,
                                      arguments:
                                          RegistrationScreenContactArguments(
                                        _firstNameController.text,
                                        _lastNameController.text,
                                        _postalCodeController.text,
                                        _cityController.text,
                                        _streetController.text,
                                        _country,
                                        _title,
                                        _birthday,
                                      ),
                                    );
                                  }
                                },
                                elevation: 0,
                                padding: EdgeInsets.symmetric(vertical: 20),
                                child: Text(
                                  'Weiter',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
