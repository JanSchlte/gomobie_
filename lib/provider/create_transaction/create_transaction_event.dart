part of 'create_transaction_bloc.dart';

@immutable
abstract class CreateTransactionEvent {}

class AddDataCreateTransactionEvent extends CreateTransactionEvent {
  final int amount;
  final String title;
  final String receiver;

  AddDataCreateTransactionEvent({this.amount, this.title, this.receiver});
}

class ConfirmTransactionEvent extends CreateTransactionEvent {}

class TransactionsSuccessEvent extends CreateTransactionEvent {}

class TransactionFailedEvent extends CreateTransactionEvent {}
