part of 'auth_bloc.dart';

@immutable
class AuthState {
  final FirebaseUser user;
  final bool working;
  final bool failed;

  AuthState({
    this.user,
    this.working = false,
    this.failed = false,
  });

  factory AuthState.loggedOut() => AuthState();

  factory AuthState.loggedIn(FirebaseUser user) => AuthState(user: user);

  factory AuthState.working() => AuthState(working: true);

  factory AuthState.failed() => AuthState(failed: true);

  bool get isLoggedIn => user != null;
}
