import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:gomobie/provider/auth_provider.dart';
import 'package:provider/provider.dart';

import '../validators.dart' as validators;
import 'home.dart';
import 'registration_screens/registration_screen_personal.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login';
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  Widget _buildHeader() {
    return Column(
      children: <Widget>[
        SizedBox(height: 40),
        Image.asset(
          'assets/logo/app_logo.png',
          height: 75,
        ),
        RichText(
          text: TextSpan(
            text: 'GO',
            style: TextStyle(
                color: Color(0xFF1ABC9C),
                fontSize: 35,
                fontWeight: FontWeight.w500),
            children: [
              TextSpan(text: 'MOBIE', style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
        Padding(
          //TODO: This might not fit on all screen sizes
          padding: EdgeInsets.only(left: 55),
          child: Text(
            'PAY. LEARN. CONTROL.',
            style: TextStyle(fontSize: 10, color: Colors.grey),
          ),
        ),
        SizedBox(height: 40),
      ],
    );
  }

  Widget _buildEmailField() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xFF949494).withOpacity(0.5),
              prefixIcon: Icon(Icons.mail_outline, color: Colors.white),
              labelText: 'Email / Kundennummer',
              labelStyle: TextStyle(color: Colors.white),
            ),
            style: TextStyle(color: Colors.white),
            validator: (email) {
              if (email.trim().isEmpty) {
                return 'Dieses Feld darf nicht leer sein';
              } else if (!validators.isValidEmail(email)) {
                return 'Ungültige Email-Adresse';
              }
              return null;
            },
          ),
        ),
        SizedBox(height: 10)
      ],
    );
  }

  Widget _buildPasswordField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: _passwordController,
        obscureText: true,
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xFF949494).withOpacity(0.5),
          prefixIcon: Icon(
            Icons.lock_outline,
            color: Colors.white,
          ),
          labelText: 'Passwort',
          labelStyle: TextStyle(color: Colors.white),
        ),
        style: TextStyle(color: Colors.white),
        validator: (email) {
          if (email.trim().length < 6) {
            return 'Mindestends 6 Buchstaben';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildLostPassword(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(),
        ),
        FlatButton(
          onPressed: () {},
          child: Text(
            'Passwort vergessen?',
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        ),
        SizedBox(width: 7)
      ],
    );
  }

  Widget _buildSignInButton(BuildContext context) {
    return RaisedButton(
      onPressed: () async {
        if (_formKey.currentState.validate()) {
          final success = await context.read<AuthProvider>().login(
                email: _emailController.text,
                password: _passwordController.text,
              );
          if (success) {
            Navigator.of(context).pushNamed(Home.routeName);
          }
        }
      },
      child: Text('ANMELDEN'),
      textColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      elevation: 8,
      padding: EdgeInsets.symmetric(horizontal: 137, vertical: 20),
    );
  }

  Widget _buildRegisterButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Du hast noch keinen Account?',
          style: TextStyle(color: Colors.white),
        ),
        FlatButton(
          onPressed: () {
            Navigator.of(context).pushNamed(RegistrationScreenOne.routeName);
          },
          child: Text(
            'Hier registrieren',
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/login_screen/login_background.png'),
              fit: BoxFit.fill)),
      child: Material(
        color: Colors.grey.shade800.withOpacity(0.8),
        child: SafeArea(
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  _buildHeader(),
                  _buildEmailField(),
                  _buildPasswordField(),
                  _buildLostPassword(context),
                  _buildSignInButton(context),
                  Expanded(child: Container()),
                  _buildRegisterButton(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
