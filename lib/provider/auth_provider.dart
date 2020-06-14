import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import '../models/user_data.dart';

class AuthProvider extends ChangeNotifier {
  FirebaseUser _currentUser;
  UserData _userData;

  bool get isLoggedIn => _currentUser != null;

  void _getUserData() async => _userData = await UserData.get(_currentUser);

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
