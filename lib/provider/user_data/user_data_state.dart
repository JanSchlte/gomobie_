part of 'user_data_bloc.dart';

@immutable
abstract class UserDataState {
  bool get isRegistering;
}

class InitialUserDataState extends UserDataState {
  @override
  bool get isRegistering => false;
}

class LoggedInUserState extends UserDataState {
  final UserData data;

  LoggedInUserState(this.data);

  @override
  bool get isRegistering => false;
}

class UserRegisteringData extends LoggedInUserState {
  final PrivateUserData privateUserData;

  UserRegisteringData(UserData data, {this.privateUserData}) : super(data);

  @override
  bool get isRegistering => true;
}

class UserStandardData extends LoggedInUserState {
  List<BankAccount> bankAccounts;
  List<CreditCard> creditCards;
  List<UserData> children;
  List<Transaction> transactions;

  UserStandardData(UserData data) : super(data);

  bool get needsBankAccount => (bankAccounts?.isEmpty ?? false);
}

class CreateChildData extends UserStandardData {
  final UserData childData;

  CreateChildData(UserData data, this.childData) : super(data);
}
