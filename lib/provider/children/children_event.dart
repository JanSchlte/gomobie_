part of 'children_bloc.dart';

@immutable
abstract class ChildrenEvent {}

class UpdateChildrenEvent extends ChildrenEvent {
  final List<UserData> children;

  UpdateChildrenEvent(this.children);
}

class NeedsRefreshEvent extends ChildrenEvent {}

class AddChildEvent extends ChildrenEvent {
  final UserData childData;
  final PrivateUserData privateChildData;

  AddChildEvent(this.childData, {this.privateChildData});
}
