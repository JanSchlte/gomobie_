import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:gomobie/models/bank_account.dart';
import 'package:gomobie/provider/auth/auth_bloc.dart';
import 'package:gomobie/provider/user_data/user_data_bloc.dart';
import 'package:meta/meta.dart';

part 'bank_account_event.dart';

part 'bank_account_state.dart';

class BankAccountBloc extends Bloc<BankAccountEvent, BankAccountState> {
  @override
  BankAccountState get initialState => BankAccountState();

  void addBankAccount({String owner, String iban, String bic}) {
    add(BankAccountCreationEvent(owner: owner, iban: iban, bic: bic));
  }

  void refresh() {
    add(NeedsRefreshEvent());
  }

  void _createBankAccount(BankAccountCreationEvent event) async {
    final s = GetIt.I.get<UserDataBloc>().state as LoggedInUserState;
    await BankAccount(iban: event.iban, owner: event.owner, bic: event.bic)
        .create(s.userId);
    if (s.isRegistering) {
      GetIt.I
          .get<UserDataBloc>()
          .login(user: GetIt.I.get<AuthBloc>().state.user);
    } else {
      _retrieveBankAccounts();
    }
  }

  void _retrieveBankAccounts() async {
    final s = GetIt.I.get<UserDataBloc>().state as LoggedInUserState;
    final accounts = await s.bankAccounts;
    add(BankAccountUpdateEvent(accounts));
  }

  @override
  Stream<BankAccountState> mapEventToState(BankAccountEvent event) async* {
    if (event is BankAccountCreationEvent) {
      _createBankAccount(event);
    } else if (event is BankAccountUpdateEvent) {
      yield BankAccountState(accounts: event.accounts);
    } else if (event is NeedsRefreshEvent) {
      _retrieveBankAccounts();
    }
  }
}
