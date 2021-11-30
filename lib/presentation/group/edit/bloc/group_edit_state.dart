part of 'group_edit_bloc.dart';

@immutable
abstract class GroupEditState {}

class GroupEditInitial extends GroupEditState {}

class LoadingData extends GroupEditState {}

class DataLoaded extends GroupEditState {
  final List<Group> groups;

  DataLoaded({required this.groups});
}

class GroupEdited extends GroupEditState {
  final String message;
  GroupEdited({required this.message});
}

class GroupNotEdited extends GroupEditState {
  final String message;
  GroupNotEdited({required this.message});
}
