import 'package:flutter/material.dart';
import 'package:gomobie/provider/auth_provider.dart';
import 'package:provider/provider.dart';

import 'registration_success.dart';

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

  //final TextEditingController _cardNumberController = TextEditingController();
  //final TextEditingController _validUntilController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30.0,
              ),
              Image.asset(
                'assets/registration_screens/registration_bankkarte.png',
                width: 180,
              ),
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
                      /*SizedBox(height: 10),
                      //TODO: Man sollte eine Kreditkarte auf einem seperaten screen hinzufügen können
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
                      ),*/
                    ],
                  ),
                ),
              ),
              Expanded(child: Container()),
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
                          context.read<AuthProvider>().addBankAccount(
                              owner: _accountHolderController.value.text,
                              iban: _ibanController.value.text,
                              bic: _bicController.value.text);
                          if (context.read<AuthProvider>().isRegistering) {
                            Navigator.of(context)
                                .pushNamed(RegistrationSuccess.routeName);
                          } else {
                            Navigator.of(context).pop();
                          }
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
    );
  }
}
