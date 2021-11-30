part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

class LoadingProfile extends ProfileEvent {}

class Logout extends ProfileEvent {}

class DeleteGroup extends ProfileEvent {
  final int groupId;

  DeleteGroup({required this.groupId});
}

class SelectGroup extends ProfileEvent{
  final int groupId;
  SelectGroup({required this.groupId});
}
