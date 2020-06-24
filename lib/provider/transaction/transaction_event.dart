part of 'transaction_bloc.dart';

@immutable
abstract class TransactionEvent {}

class NeedsRefreshEvent extends TransactionEvent {}

class TransactionUpdateEvent extends TransactionEvent {
  final List<Transaction> transactions;

  TransactionUpdateEvent(this.transactions);
}

class CreateTransactionEvent extends TransactionEvent {
  final int amount;
  final String title;
  final String receiver;

  CreateTransactionEvent({this.amount, this.title, this.receiver});
}
