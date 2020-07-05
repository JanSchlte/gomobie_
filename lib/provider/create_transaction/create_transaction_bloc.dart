import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:gomobie/models/transaction.dart';
import 'package:gomobie/provider/transaction/transaction_bloc.dart';
import 'package:gomobie/provider/user_data/user_data_bloc.dart';
import 'package:meta/meta.dart';

part 'create_transaction_event.dart';

part 'create_transaction_state.dart';

class CreateTransactionBloc
    extends Bloc<CreateTransactionEvent, CreateTransactionState> {
  @override
  CreateTransactionState get initialState => InitialCreateTransactionState();

  void _createTransaction() async {
    final s = GetIt.I.get<UserDataBloc>().state as LoggedInUserState;
    final current = state as DataCreateTransactionsState;
    try {
      await Transaction(
        amount: current.amount,
        title: current.title,
        receiver: current.receiver,
        sender: s.userId,
        created: DateTime.now(),
      ).create();
      GetIt.I.get<TransactionBloc>().refresh();
    } on Exception catch (e, s) {
      add(TransactionFailedEvent());
      return;
    }
    add(TransactionsSuccessEvent());
  }

  @override
  Stream<CreateTransactionState> mapEventToState(
      CreateTransactionEvent event) async* {
    if (event is AddDataCreateTransactionEvent) {
      yield DataCreateTransactionsState(
          amount: event.amount, title: event.title, receiver: event.receiver);
    } else if (event is ConfirmTransactionEvent) {
      _createTransaction();
    } else if (event is TransactionsSuccessEvent) {
      yield SucceededTransactionsState();
    } else if (event is TransactionFailedEvent) {
      yield FailedTransactionState();
    }
  }
}
