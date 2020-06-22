import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gomobie/models/bank_account.dart';
import 'package:gomobie/models/credit_card.dart';
import 'package:gomobie/models/private_user_data.dart';
import 'package:gomobie/models/transaction.dart';
import 'package:gomobie/models/user_data.dart';
import 'package:meta/meta.dart';

part 'user_data_event.dart';

part 'user_data_state.dart';

enum RegistrationContext { newUser, child }

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
    DateTime birthday, {
    RegistrationContext context = RegistrationContext.newUser,
  }) {
    if (context == RegistrationContext.newUser) {
      add(
        RegisterEvent(
          UserData(
            firstName: firstName,
            lastName: lastName,
          ),
          PrivateUserData(
            postalCode: postalCode,
            city: city,
            street: street,
            country: country,
            title: title,
            birthday: birthday,
          ),
        ),
      );
    }
  }

  void logout() => add(UserDataEvent());

  Future<void> create({
    FirebaseUser user,
    String idNumber,
    String email,
    String phone,
  }) {
    final s = (state as UserRegisteringData);
    return s.data
        .create(user, s.privateUserData..idNumber = idNumber, email, phone)
        .then((value) {
      add(RegisterEvent(value, null));
      return;
    });
  }

  Future<void> login({FirebaseUser user}) =>
      UserData.get(user.uid).then((value) {
        add(UserEvent(value));
        return;
      });

  Future<void> addBankAccount({String owner, String iban, String bic}) {
    return BankAccount(iban: iban, bic: bic, owner: owner)
        .create((state as UserStandardData).data.snapshot.reference);
  }

  void createTransaction({String receiver, int amount, String title}) async {
    final s = state as UserStandardData;
    final transaction = Transaction(
      title: title,
      receiver: receiver,
      sender: s.data.userId,
      amount: amount,
      created: DateTime.now(),
    );
    await transaction.create();
    _retrieveTransactions();
  }

  void _retrieveTransactions() {
    final d = (state as UserStandardData).data;
    d.transactions.then((value) {
      add(TransactionUpdateEvent(value));
    });
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
    _retrieveTransactions();
  }

  @override
  Stream<UserDataState> mapEventToState(UserDataEvent event) async* {
    if (event is RegisterEvent) {
      yield UserRegisteringData(event.data,
          privateUserData: event.privateUserData);
    } else if (event is ChildCreationEvent) {
      yield CreateChildData((state as UserStandardData).data, event.data);
    } else if (event is UserEvent) {
      yield UserStandardData(event.data);
      if (event.data.snapshot != null) {
        _retrieveAccounts();
      }
    } else if (event is BankAccountUpdateEvent) {
      final s = state as UserStandardData;
      yield s..bankAccounts = event.bankAccounts;
    } else if (event is ChildrenUpdateEvent) {
      final s = state as UserStandardData;
      yield s..children = event.children;
    } else if (event is CreditCardUpdateEvent) {
      final s = state as UserStandardData;
      yield s..creditCards = event.creditCards;
    } else if (event is TransactionUpdateEvent) {
      final s = state as UserStandardData;
      yield s..transactions = event.transactions;
    } else {
      yield InitialUserDataState();
    }
  }
}
