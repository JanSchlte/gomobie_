part of 'user_data_bloc.dart';

@immutable
abstract class UserDataState {
  bool get isRegistering;
}

class InitialUserDataState extends UserDataState {
  @override
  bool get isRegistering => false;
}

class UserRegisteringData extends UserDataState {
  final UserData data;

  UserRegisteringData(this.data);

  @override
  bool get isRegistering => true;
}

class UserStandardData extends UserRegisteringData {
  List<BankAccount> bankAccounts;
  List<CreditCard> creditCards;
  List<UserData> children;

  UserStandardData(UserData data) : super(data);

  @override
  bool get isRegistering => false;
}

class CreateChildData extends UserStandardData {
  final UserData childData;

  CreateChildData(UserData data, this.childData) : super(data);
}
