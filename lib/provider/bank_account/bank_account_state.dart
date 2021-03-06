part of 'bank_account_bloc.dart';

@immutable
class BankAccountState {
  final List<BankAccount> accounts;

  BankAccountState({this.accounts});

  bool get needsBankAccount => (accounts?.isEmpty ?? false);
}
