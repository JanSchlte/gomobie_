part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class LoginResponseEvent extends AuthEvent {
  final FirebaseUser user;

  LoginResponseEvent(this.user);
}

class RegisterResponseEvent extends LoginResponseEvent {
  RegisterResponseEvent(FirebaseUser user) : super(user);
}

class LoginFailedEvent extends AuthEvent {}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  LoginEvent(this.email, this.password);
}

class RegisterEvent extends LoginEvent {
  final String idNumber;
  final String phone;

  RegisterEvent(String email, String password, this.idNumber, this.phone)
      : super(email, password);
}

class LogoutEvent extends AuthEvent {}
