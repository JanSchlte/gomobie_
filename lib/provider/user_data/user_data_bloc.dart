import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gomobie/models/bank_account.dart';
import 'package:gomobie/models/credit_card.dart';
import 'package:gomobie/models/user_data.dart';
import 'package:meta/meta.dart';

part 'user_data_event.dart';

part 'user_data_state.dart';

class UserDataBloc extends Bloc<UserDataEvent, UserDataState> {
  @override
  UserDataState get initialState => InitialUserDataState();

  void setRegisterArgs(
    String firstName,
    String lastName,
    int postalCode,
    String city,
    String street,
    String country,
    String title,
    DateTime birthday,
  ) {
    add(UserEvent(UserData(
      firstName: firstName,
      lastName: lastName,
      postalCode: postalCode,
      city: city,
      street: street,
      country: country,
      title: title,
      birthday: birthday,
    )));
  }

  void logout() => add(UserDataEvent());

  Future<void> create({FirebaseUser user, String idNumber}) =>
      (state as UserStandardData).data.create(user, idNumber).then((value) {
        add(UserEvent(value));
        return;
      });

  Future<void> login({FirebaseUser user}) =>
      UserData.get(user.uid).then((value) {
        add(UserEvent(value));
        return;
      });

  Future<void> addBankAccount({String owner, String iban, String bic}) {
    return BankAccount(iban: iban, bic: bic, owner: owner)
        .create((state as UserStandardData).data.snapshot.reference);
  }

  void _retrieveAccounts() {
    final d = (state as UserStandardData).data;
    d.bankAccounts.then((value) {
      add(BankAccountUpdateEvent(value));
    });
    d.creditCards.then((value) {
      add(CreditCardUpdateEvent(value));
    });
    d.children.then((value) {
      add(ChildrenUpdateEvent(value));
    });
  }

  @override
  Stream<UserDataState> mapEventToState(UserDataEvent event) async* {
    if (event is UserEvent) {
      yield UserStandardData(event.data);
      _retrieveAccounts();
    } else if (event is RegisterEvent) {
      yield UserRegisteringData(event.data);
    } else if (event is ChildCreationEvent) {
      yield CreateChildData((state as UserStandardData).data, event.data);
    } else if (event is BankAccountUpdateEvent) {
      final s = state as UserStandardData;
      yield s..bankAccounts = event.bankAccounts;
    } else if (event is ChildrenUpdateEvent) {
      final s = state as UserStandardData;
      yield s..children = event.children;
    } else if (event is CreditCardUpdateEvent) {
      final s = state as UserStandardData;
      yield s..creditCards = event.creditCards;
    } else {
      yield InitialUserDataState();
    }
  }
}
