part of 'children_bloc.dart';

class ChildrenState {
  final List<UserData> children;

  ChildrenState({this.children = const []});
}

class ChildRegisterState extends ChildrenState {
  final UserData childData;
  final PrivateUserData privateChildData;

  ChildRegisterState(List<UserData> children, this.childData,
      {this.privateChildData})
      : super(children: children);

  factory ChildRegisterState.fromChildrenState(
          ChildrenState state, UserData childData,
          {PrivateUserData privateChildData}) =>
      ChildRegisterState(
        state.children,
        childData,
        privateChildData: privateChildData,
      );
}
