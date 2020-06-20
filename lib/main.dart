import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gomobie/pages/home/actions/make_transactions.dart';
import 'package:gomobie/pages/home/actions/transaction_confirmation.dart';
import 'package:gomobie/pages/home/groups.dart';
import 'package:provider/provider.dart';
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
import 'provider/auth_provider.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final user = await FirebaseAuth.instance.currentUser();
  runApp(App(
    isLoggedIn: user != null,
  ));
}

class App extends StatelessWidget {
  final bool isLoggedIn;

  const App({Key key, this.isLoggedIn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: AuthProvider())],
      child: MaterialApp(
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
            )),
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
          TransactionScreen.routeName: (_) => TransactionScreen(),
          TransactionConfirmation.routeName: (_) => TransactionConfirmation()
        },
        initialRoute: isLoggedIn
            ? TransactionConfirmation.routeName
            : IntroScreen.routeName,
      ),
    );
  }
}
