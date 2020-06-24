part of 'bank_account_bloc.dart';

@immutable
abstract class BankAccountEvent {}

class NeedsRefreshEvent extends BankAccountEvent {}

class BankAccountUpdateEvent extends BankAccountEvent {
  final List<BankAccount> accounts;

  BankAccountUpdateEvent(this.accounts);
}

class BankAccountCreationEvent extends BankAccountEvent {
  final String owner, iban, bic;

  BankAccountCreationEvent({this.owner, this.iban, this.bic});
}
