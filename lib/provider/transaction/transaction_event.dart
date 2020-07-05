part of 'transaction_bloc.dart';

@immutable
abstract class TransactionEvent {}

class NeedsRefreshEvent extends TransactionEvent {}

class TransactionUpdateEvent extends TransactionEvent {
  final List<Transaction> transactions;

  TransactionUpdateEvent(this.transactions);
}
