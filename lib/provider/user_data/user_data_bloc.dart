import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:gomobie/models/credit_card.dart';
import 'package:gomobie/models/private_user_data.dart';
import 'package:gomobie/models/user_data.dart';
import 'package:gomobie/provider/bank_account/bank_account_bloc.dart';
import 'package:gomobie/provider/transaction/transaction_bloc.dart';
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
    DateTime birthday,
  ) {
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

  void logout() => add(UserDataEvent());

  Future<void> create({
    FirebaseUser user,
    String idNumber,
    String email,
    String phone,
  }) {
    final s = (state as UserRegisteringData);
    //TODO: Refactor create into UserRegisteringData
    return s.create(user, s.privateUserData..idNumber = idNumber, email, phone);
  }

  Future<void> login({FirebaseUser user}) =>
      UserData.get(user.uid).then((value) {
        add(UserEvent(value));
        return;
      });

  void _retrieveAccounts() {
    GetIt.I.get<BankAccountBloc>().refresh();
    GetIt.I.get<TransactionBloc>().refresh();
  }

  @override
  Stream<UserDataState> mapEventToState(UserDataEvent event) async* {
    if (event is RegisterEvent) {
      yield UserRegisteringData(
        event.data.firstName,
        event.data.lastName,
        event.data.email,
        event.data.phone,
        privateUserData: event.privateUserData,
      );
    } else if (event is UserEvent) {
      yield LoggedInUserState(
        event.data.firstName,
        event.data.lastName,
        event.data.email,
        event.data.phone,
        childOf: event.data.childOf,
        snapshot: event.data.snapshot,
      );
      _retrieveAccounts();
    } else {
      yield InitialUserDataState();
    }
  }
}
