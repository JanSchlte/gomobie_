part of 'create_transaction_bloc.dart';

@immutable
abstract class CreateTransactionState {}

class InitialCreateTransactionState extends CreateTransactionState {}

class DataCreateTransactionsState extends CreateTransactionState {
  final int amount;
  final String title;
  final String receiver;

  DataCreateTransactionsState({this.amount, this.title, this.receiver});
}

class FailedTransactionState extends CreateTransactionState {}

class SucceededTransactionsState extends CreateTransactionState {}
