import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:gomobie/provider/user_data/user_data_bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  @override
  AuthState get initialState => AuthState.loggedOut();

  AuthBloc(FirebaseUser user) {
    add(LoginResponseEvent(user));
  }

  void login({String email, String password}) =>
      add(LoginEvent(email, password));

  void register(
          {String email, String password, String idNumber, String phone}) =>
      add(RegisterEvent(email, password, idNumber, phone));

  void logout() => add(LogoutEvent());

  void _login({String email, String password}) async {
    try {
      final result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      add(LoginResponseEvent(result.user));
    } on PlatformException catch (e) {
      add(LoginFailedEvent());
    }
  }

  void _register(
      {String email, String password, String idNumber, String phone}) async {
    try {
      final result = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await GetIt.I.get<UserDataBloc>().create(
            user: result.user,
            idNumber: idNumber,
            email: email,
            phone: phone,
          );
      add(LoginResponseEvent(result.user));
    } on PlatformException catch (e) {
      add(LoginFailedEvent());
    }
  }

  void _logout() {
    FirebaseAuth.instance.signOut();
    GetIt.I.get<UserDataBloc>().logout();
  }

  Future<void> _updateUserData(FirebaseUser user) =>
      GetIt.I.get<UserDataBloc>().login(user: user);

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is LoginEvent) {
      yield AuthState.working();
      if (event is RegisterEvent) {
        _register(
          email: event.email,
          password: event.password,
          idNumber: event.idNumber,
            phone: event.phone
        );
      } else {
        _login(email: event.email, password: event.password);
      }
    } else if (event is LoginFailedEvent) {
      yield AuthState.failed();
    } else if (event is LoginResponseEvent) {
      if (event.user != null) {
        yield AuthState.loggedIn(event.user);
        _updateUserData(event.user);
      }
    } else if (event is LogoutEvent) {
      _logout();
      yield AuthState.loggedOut();
    }
  }
}
