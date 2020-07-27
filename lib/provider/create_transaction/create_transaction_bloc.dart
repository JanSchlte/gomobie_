import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart' hide Transaction;
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

  void _getIdByMail(String email, {int amount, String title}) async {
    final ids = await Firestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .getDocuments();
    if (ids.documents.isEmpty) {
      throw 'Not found!';
    } else {
      add(AddDataCreateTransactionEvent(
        amount: amount,
        title: title,
        receiver: ids.documents.first.documentID,
      ));
    }
  }

  void createTransaction({int amount, String title, String receiver}) {
    if (receiver.contains('@')) {
      _getIdByMail(receiver, amount: amount, title: title);
    }
    add(AddDataCreateTransactionEvent(
        amount: amount, title: title, receiver: receiver));
  }

  void confirmTransaction() => add(ConfirmTransactionEvent());

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
