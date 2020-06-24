part of 'user_data_bloc.dart';

@immutable
class UserDataEvent {}

class UserEvent extends UserDataEvent {
  final UserData data;

  UserEvent(this.data);
}

class RegisterEvent extends UserEvent {
  final PrivateUserData privateUserData;

  RegisterEvent(UserData data, this.privateUserData) : super(data);
}

class CreditCardUpdateEvent extends UserDataEvent {
  final List<CreditCard> creditCards;

  CreditCardUpdateEvent(this.creditCards);
}
