import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:gomobie/pages/registration_screens/registration_screen_bank.dart';

import '../../util/routes/registration_screen_contact_args.dart';
import '../../validators.dart' as validators;

class RegistrationScreenContactData extends StatefulWidget {
  static const routeName = '/register/contact';

  @override
  _RegistrationScreenContactDataState createState() =>
      _RegistrationScreenContactDataState();
}

class _RegistrationScreenContactDataState
    extends State<RegistrationScreenContactData> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _idNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool _hidePassword = true;

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
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        controller: _emailController,
                                        decoration: InputDecoration(
                                            hintText: 'Email',
                                            hintStyle: TextStyle(
                                              color: Colors.grey.shade500,
                                              fontSize: 15,
                                            )),
                                        validator: (email) {
                                          if (email.trim().isEmpty) {
                                            return 'Dieses Feld darf nicht leer sein';
                                          } else if (!validators
                                              .isValidEmail(email)) {
                                            return 'Ungültige Email-Adresse';
                                          }
                                          return null;
                                        },
                                      ),
                                      Divider(thickness: 1),
                                      TextFormField(
                                        controller: _phoneNumberController,
                                        keyboardType: TextInputType.phone,
                                        decoration: InputDecoration(
                                            hintText: 'Handynummer',
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
                                      Divider(thickness: 1),
                                      TextFormField(
                                        controller: _idNumberController,
                                        decoration: InputDecoration(
                                            hintText: 'Ausweisnummer',
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
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                elevation: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        controller: _passwordController,
                                        obscureText: _hidePassword,
                                        decoration: InputDecoration(
                                          hintText: 'Passwort festlegen',
                                          hintStyle: TextStyle(
                                            color: Colors.grey.shade500,
                                            fontSize: 15,
                                          ),
                                          suffixIcon:
                                              _buildPasswordVisibility(),
                                        ),
                                        validator: (password) {
                                          if (password.trim().length < 8) {
                                            return 'Das Passwort muss mindestens 8 Zeichen lang sein';
                                          }
                                          return null;
                                        },
                                      ),
                                      Divider(thickness: 1),
                                      TextFormField(
                                        obscureText: _hidePassword,
                                        decoration: InputDecoration(
                                          hintText: 'Passwort wiederholen',
                                          hintStyle: TextStyle(
                                            color: Colors.grey.shade500,
                                            fontSize: 15,
                                          ),
                                          suffixIcon:
                                              _buildPasswordVisibility(),
                                        ),
                                        validator: (password) {
                                          if (password !=
                                              _passwordController.text) {
                                            return 'Die Passwörter stimmen nicht überein';
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
                                  Navigator.of(context).pushNamed(
                                      RegistrationScreenBank.routeName);
                                }
                              },
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

  IconButton _buildPasswordVisibility() {
    return IconButton(
        icon: Icon(_hidePassword ? Icons.visibility_off : Icons.visibility),
        onPressed: () {
          setState(() {
            _hidePassword = !_hidePassword;
          });
        });
  }
}
