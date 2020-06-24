part of 'user_data_bloc.dart';

@immutable
abstract class UserDataState {
  bool get isRegistering;
}

class InitialUserDataState extends UserDataState {
  @override
  bool get isRegistering => false;
}

class LoggedInUserState extends UserData implements UserDataState {
  @override
  bool get isRegistering => false;

  LoggedInUserState(
    String firstName,
    String lastName,
    String email,
    String phone, {
    List<String> childOf = const [],
    DocumentSnapshot snapshot,
  }) : super(
          firstName: firstName,
          lastName: lastName,
          email: email,
          phone: phone,
          childOf: childOf,
          snapshot: snapshot,
        );
}

class UserRegisteringData extends LoggedInUserState {
  final PrivateUserData privateUserData;

  UserRegisteringData(String firstName,
      String lastName,
      String email,
      String phone, {
        this.privateUserData,
      }) : super(firstName, lastName, email, phone);

  @override
  bool get isRegistering => true;
}

class CreateChildData extends LoggedInUserState {
  final UserData childData;

  CreateChildData(String firstName,
      String lastName,
      String email,
      String phone,
      this.childData,) : super(firstName, lastName, email, phone);
}
