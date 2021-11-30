part of 'create_group_bloc.dart';

@immutable
abstract class CreateGroupEvent {}


class CreateGroup extends CreateGroupEvent{
  final String name;
  CreateGroup({required this.name});
}