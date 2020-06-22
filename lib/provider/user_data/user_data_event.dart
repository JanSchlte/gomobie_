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

class ChildrenUpdateEvent extends UserDataEvent {
  final List<UserData> children;

  ChildrenUpdateEvent(this.children);
}

class BankAccountUpdateEvent extends UserDataEvent {
  final List<BankAccount> bankAccounts;

  BankAccountUpdateEvent(this.bankAccounts);
}

class TransactionUpdateEvent extends UserDataEvent {
  final List<Transaction> transactions;

  TransactionUpdateEvent(this.transactions);
}

class CreditCardUpdateEvent extends UserDataEvent {
  final List<CreditCard> creditCards;

  CreditCardUpdateEvent(this.creditCards);
}

class ChildCreationEvent extends UserEvent {
  ChildCreationEvent(UserData data) : super(data);
}
