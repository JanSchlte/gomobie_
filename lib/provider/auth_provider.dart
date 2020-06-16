import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:gomobie/models/bank_account.dart';

import '../models/user_data.dart';

class AuthProvider extends ChangeNotifier {
  FirebaseUser _currentUser;
  UserData _userData;
  UserData _currentRegistration;

  bool get isLoggedIn => _currentUser != null;

  void _getUserData() async => _userData = await UserData.get(_currentUser);

  void setRegisterArgs(
      String firstName,
      String lastName,
      int postalCode,
      String city,
      String street,
      String country,
      String title,
      DateTime birthday) {
    _currentRegistration = UserData(
      firstName: firstName,
      lastName: lastName,
      postalCode: postalCode,
      city: city,
      street: street,
      country: country,
      title: title,
      birthday: birthday,
    );
  }

  Future<bool> login({String email, String password}) async {
    try {
      final authResult = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      _currentUser = authResult.user;
      _getUserData();
      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  //TODO: Add dialog to indicate loading and error reporting!
  Future<bool> register(
      {String email, String password, String idNumber}) async {
    if (_currentRegistration == null) {
      throw ArgumentError.notNull('_currentRegistration');
    }
    try {
      final authResult = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      _currentUser = authResult.user;
      await _currentRegistration.create(_currentUser, idNumber);
      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  Future<void> addBankAccount({String owner, String iban, String bic}) {
    if (isLoggedIn) {
      return BankAccount(iban: iban, bic: bic, owner: owner)
          .create(_currentUser);
    }
  }

  // Listen to authentication changes
  void _registerListener() {
    FirebaseAuth.instance.onAuthStateChanged.listen(
      (event) {
        _currentUser = event;
        notifyListeners();
      },
    );
  }

  AuthProvider() {
    _registerListener();
  }
}
