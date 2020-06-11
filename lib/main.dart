import 'package:flutter/material.dart';
import 'package:gomobie/pages/registration_screen_1.dart';

import 'pages/intro_screen.dart';
import 'pages/login_screen.dart';

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
        RegistrationScreenOne.routeName: (_) => RegistrationScreenOne()
      },
      initialRoute: IntroScreen.routeName,
    );
  }
}
