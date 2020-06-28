import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:gomobie/models/private_user_data.dart';
import 'package:gomobie/models/user_data.dart';
import 'package:gomobie/provider/user_data/user_data_bloc.dart';
import 'package:meta/meta.dart';

part 'children_event.dart';
part 'children_state.dart';

class ChildrenBloc extends Bloc<ChildrenEvent, ChildrenState> {
  @override
  ChildrenState get initialState => ChildrenState();

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
      AddChildEvent(
        UserData(
          firstName: firstName,
          lastName: lastName,
        ),
        privateChildData: PrivateUserData(
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

  void registerChild() {}

  void refresh() {
    add(NeedsRefreshEvent());
  }

  void _retrieveChildren() async {
    final s = GetIt.I.get<UserDataBloc>().state as LoggedInUserState;
    final children = await s.children;
    add(UpdateChildrenEvent(children));
  }

  @override
  Stream<ChildrenState> mapEventToState(ChildrenEvent event) async* {
    if (event is UpdateChildrenEvent) {
      yield ChildrenState(children: event.children);
    } else if (event is AddChildEvent) {
      yield ChildRegisterState.fromChildrenState(state, event.childData,
          privateChildData: event.privateChildData);
    } else if (event is NeedsRefreshEvent) {
      _retrieveChildren();
    }
  }
}
