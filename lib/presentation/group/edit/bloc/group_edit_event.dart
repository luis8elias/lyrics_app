part of 'group_edit_bloc.dart';

@immutable
abstract class GroupEditEvent {}

class LoadingEditGroup extends GroupEditEvent {}

class SaveGroup extends GroupEditEvent {
  final String name;
  final int groupId;

  SaveGroup({
    required this.name,
    required this.groupId,
  });
}
