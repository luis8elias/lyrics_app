part of 'create_group_bloc.dart';

@immutable
abstract class CreateGroupState {}

class CreateGroupInitial extends CreateGroupState {}

class GroupCreated extends CreateGroupState{
  final String message;
  GroupCreated({required this.message});
}

class GroupNotCreated extends CreateGroupState{
   final String message;
  GroupNotCreated({required this.message});
}
