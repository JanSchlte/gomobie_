import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:gomobie/pages/home/actions/create_groups.dart';
import 'package:gomobie/pages/home/actions/make_transactions.dart';
import 'package:gomobie/pages/home/actions/transaction_confirmation.dart';
import 'package:gomobie/pages/home/groups.dart';
import 'package:gomobie/pages/home/settings/activation_codes.dart';
import 'package:gomobie/pages/home/settings/help.dart';
import 'package:gomobie/provider/auth/auth_bloc.dart';
import 'package:gomobie/provider/user_data/user_data_bloc.dart';

import 'pages/create_child_account/child_account_bank.dart';
import 'pages/create_child_account/child_account_contact_data.dart';
import 'pages/create_child_account/child_account_personal.dart';
import 'pages/create_child_account/child_account_success.dart';
import 'pages/home.dart';
import 'pages/intro_screen.dart';
import 'pages/login_screen.dart';
import 'pages/registration_screens/registration_screen_bank.dart';
import 'pages/registration_screens/registration_screen_contact_data.dart';
import 'pages/registration_screens/registration_screen_personal.dart';
import 'pages/registration_screens/registration_success.dart';

Future<void> run() async {
  WidgetsFlutterBinding.ensureInitialized();
  Crashlytics.instance.crash();
  final user = await FirebaseAuth.instance.currentUser();
  GetIt.I.registerSingleton(AuthBloc(user));
  GetIt.I.registerSingleton(UserDataBloc());
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  runApp(App(
    isLoggedIn: user != null,
  ));
}

void main() {
  FlutterError.onError = Crashlytics.instance.recordFlutterError;
  runZonedGuarded(
    () async {
      if (kDebugMode) {
        WidgetsFlutterBinding.ensureInitialized();
        //await Firestore.instance
        //   .settings(host: '192.168.178.24:8080', sslEnabled: false);
      }
      await run();
    },
    Crashlytics.instance.recordError,
  );
}

class App extends StatelessWidget {
  final bool isLoggedIn;

  const App({Key key, this.isLoggedIn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textSelectionHandleColor: Color(0xFF1ABC9C),
        primaryColor: Color(0xFF1ABC9C),
        cursorColor: Color(0xFF1ABC9C),
        fontFamily: 'Metropolis',
        visualDensity: VisualDensity.adaptivePlatformDensity,
        buttonColor: Color(0xFF1ABC9C),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF1ABC9C),
        ),
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
        ChildRegistrationSuccess.routeName: (_) => ChildRegistrationSuccess(),
        CollectionGroups.routeName: (_) => CollectionGroups(),
        Home.routeName: (_) => Home(),
        ActivationCodes.routeName: (_) => ActivationCodes(),
        Help.routeName: (_) => Help(),
        TransactionScreen.routeName: (_) => TransactionScreen(),
        TransactionConfirmation.routeName: (_) => TransactionConfirmation(),
        CreateGroup.routeName: (_) => CreateGroup()
      },
      initialRoute: isLoggedIn ? Home.routeName : IntroScreen.routeName,
    );
  }
}
