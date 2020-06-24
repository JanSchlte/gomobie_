import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gomobie/models/private_user_data.dart';
import 'package:gomobie/models/user_data.dart';
import 'package:meta/meta.dart';

part 'children_event.dart';

part 'children_state.dart';

class ChildrenBloc extends Bloc<ChildrenEvent, ChildrenState> {
  @override
  ChildrenState get initialState => ChildrenState();

  @override
  Stream<ChildrenState> mapEventToState(ChildrenEvent event) async* {
    if (event is UpdateChildrenEvent) {
      yield ChildrenState(children: event.children);
    } else if (event is AddChildEvent) {
      yield ChildRegisterState.fromChildrenState(state, event.childData);
    }
  }
}
