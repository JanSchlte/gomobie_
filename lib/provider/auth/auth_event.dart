part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class LoginResponseEvent extends AuthEvent {
  final FirebaseUser user;

  LoginResponseEvent(this.user);
}

class LoginFailedEvent extends AuthEvent {}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  LoginEvent(this.email, this.password);
}

class RegisterEvent extends LoginEvent {
  final String idNumber;

  RegisterEvent(String email, String password, this.idNumber)
      : super(email, password);
}

class LogoutEvent extends AuthEvent {}
