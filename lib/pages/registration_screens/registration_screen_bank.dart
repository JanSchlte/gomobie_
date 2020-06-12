import 'package:flutter/material.dart';
import 'package:gomobie/pages/registration_success.dart';

class RegistrationScreenBank extends StatefulWidget {
  static const routeName = '/register/bank';

  @override
  _RegistrationScreenBankState createState() => _RegistrationScreenBankState();
}

class _RegistrationScreenBankState extends State<RegistrationScreenBank> {
  final TextEditingController _accountHolderController =
      TextEditingController();
  final TextEditingController _ibanController = TextEditingController();
  final TextEditingController _bicController = TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _validUntilController = TextEditingController();
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
                          'assets/registration_screens/registration_bankkarte.png'),
                      SizedBox(height: 30.0),
                      Text(
                        'Bankkonto hinzufügen',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      Form(
                        key: _formKey,
                        child: Padding(
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
                                    children: [
                                      TextFormField(
                                        controller: _accountHolderController,
                                        decoration: InputDecoration(
                                            hintText: 'Kontoinhaber',
                                            hintStyle: TextStyle(
                                              color: Colors.grey.shade500,
                                              fontSize: 15,
                                            )),
                                        validator: (id) {
                                          if (id.trim().isEmpty) {
                                            return 'Dieses Feld kann nicht leer sein';
                                          }
                                          return null;
                                        },
                                      ),
                                      Divider(thickness: 1),
                                      TextFormField(
                                        controller: _ibanController,
                                        decoration: InputDecoration(
                                            hintText: 'IBAN',
                                            hintStyle: TextStyle(
                                              color: Colors.grey.shade500,
                                              fontSize: 15,
                                            )),
                                        validator: (id) {
                                          if (id.trim().isEmpty) {
                                            return 'Dieses Feld kann nicht leer sein';
                                          }
                                          return null;
                                        },
                                      ),
                                      Divider(thickness: 1),
                                      TextFormField(
                                        controller: _bicController,
                                        decoration: InputDecoration(
                                            hintText: 'BIC',
                                            hintStyle: TextStyle(
                                              color: Colors.grey.shade500,
                                              fontSize: 15,
                                            )),
                                        validator: (phoneNumber) {
                                          if (phoneNumber.trim().isEmpty) {
                                            return 'Dieses Feld kann nicht leer sein';
                                          }
                                          return null;
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text('optional'),
                              SizedBox(height: 10),
                              Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                elevation: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        keyboardType: TextInputType.number,
                                        controller: _cardNumberController,
                                        decoration: InputDecoration(
                                            hintText: 'Kartennummer',
                                            hintStyle: TextStyle(
                                              color: Colors.grey.shade500,
                                              fontSize: 15,
                                            )),
                                        validator: (id) {
                                          if (id.trim().isEmpty) {
                                            return 'Dieses Feld kann nicht leer sein';
                                          }
                                          return null;
                                        },
                                      ),
                                      Divider(thickness: 1),
                                      TextFormField(
                                        controller: _validUntilController,
                                        decoration: InputDecoration(
                                            hintText: 'Gültig bis',
                                            hintStyle: TextStyle(
                                              color: Colors.grey.shade500,
                                              fontSize: 15,
                                            )),
                                        validator: (phoneNumber) {
                                          if (phoneNumber.trim().isEmpty) {
                                            return 'Dieses Feld kann nicht leer sein';
                                          }
                                          return null;
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 22),
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
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  Navigator.of(context)
                                      .pushNamed(RegistrationSuccess.routeName);
                                }
                              },
                              elevation: 0,
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: Text(
                                'Fertig',
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
