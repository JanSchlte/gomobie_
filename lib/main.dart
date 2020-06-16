import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gomobie/pages/create_child_account/child_account_bank.dart';
import 'package:gomobie/pages/create_child_account/child_account_contact_data.dart';
import 'package:gomobie/pages/create_child_account/child_account_personal.dart';
import 'package:gomobie/pages/create_child_account/child_account_success.dart';
import 'package:gomobie/pages/registration_screens/registration_screen_bank.dart';
import 'package:gomobie/pages/registration_screens/registration_screen_contact_data.dart';
import 'package:gomobie/pages/registration_screens/registration_screen_personal.dart';
import 'package:gomobie/provider/auth_provider.dart';
import 'package:provider/provider.dart';

import 'pages/create_child_account/child_account_personal.dart';
import 'pages/intro_screen.dart';
import 'pages/login_screen.dart';
import 'pages/registration_screens/registration_success.dart';

void main() {
  runApp(App());
  FirebaseAuth.instance.signOut();
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: AuthProvider())],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          textSelectionHandleColor: Color(0xFF1ABC9C),
          primaryColor: Color(0xFF1ABC9C),
          cursorColor: Color(0xFF1ABC9C),
          fontFamily: 'Avenir',
          visualDensity: VisualDensity.adaptivePlatformDensity,
          buttonColor: Color(0xFF1ABC9C),
        ),
        routes: {
          IntroScreen.routeName: (_) => IntroScreen(),
          LoginScreen.routeName: (_) => LoginScreen(),
          RegistrationScreenOne.routeName: (_) => RegistrationScreenOne(),
          RegistrationScreenBank.routeName: (_) => RegistrationScreenBank(),
          RegistrationSuccess.routeName: (_) => RegistrationSuccess(),
          RegistrationScreenContactData.routeName: (_) =>
              RegistrationScreenContactData(),
          ChildAccountPersonal.routeName: (_) => ChildAccountPersonal(),
          ChildAccountContactData.routeName: (_) => ChildAccountContactData(),
          ChildAccountBank.routeName: (_) => ChildAccountBank(),
          ChildRegistrationSuccess.routeName: (_) => ChildRegistrationSuccess()
        },
        initialRoute: IntroScreen.routeName,
      ),
    );
  }
}
