import 'package:flutter/material.dart';
import 'package:gomobie/pages/registration_screens/registration_screen_contact_data.dart';
import 'package:gomobie/pages/registration_screens/registration_screen_personal.dart';

import 'pages/intro_screen.dart';
import 'pages/login_screen.dart';
import 'pages/registration_success.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textSelectionHandleColor: Color(0xFF1ABC9C),
        //TODO: TextSelectionHandleColor eigentlich umgestellt, bleibt aber immer noch blau
        primaryColor: Color(0xFF1ABC9C),
        fontFamily: 'Avenir',
        visualDensity: VisualDensity.adaptivePlatformDensity,
        buttonColor: Color(0xFF1ABC9C),
      ),
      routes: {
        IntroScreen.routeName: (_) => IntroScreen(),
        LoginScreen.routeName: (_) => LoginScreen(),
        RegistrationScreenOne.routeName: (_) => RegistrationScreenOne(),
        RegistrationSuccess.routeName: (_) => RegistrationSuccess(),
        RegistrationScreenContactData.routeName: (_) =>
            RegistrationScreenContactData()
      },
      initialRoute: IntroScreen.routeName,
    );
  }
}
