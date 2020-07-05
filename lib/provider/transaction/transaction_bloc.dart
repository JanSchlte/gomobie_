import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:gomobie/models/transaction.dart';
import 'package:gomobie/provider/user_data/user_data_bloc.dart';
import 'package:meta/meta.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  @override
  TransactionState get initialState => TransactionState();

  void refresh() {
    add(NeedsRefreshEvent());
  }

  void _retrieveTransactions() async {
    final s = GetIt.I.get<UserDataBloc>().state as LoggedInUserState;
    final transactions = await s.transactions;
    add(TransactionUpdateEvent(transactions));
  }

  @override
  Stream<TransactionState> mapEventToState(TransactionEvent event) async* {
    if (event is TransactionUpdateEvent) {
      yield TransactionState(transactions: event.transactions);
    } else if (event is NeedsRefreshEvent) {
      _retrieveTransactions();
    }
  }
}
