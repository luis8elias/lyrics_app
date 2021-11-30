part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class LoadingData extends ProfileState {}

class DataLoaded extends ProfileState {
  final User user;
  final List<Group> groups;

  DataLoaded({required this.user, required this.groups});
}

class SuccessLogout extends ProfileState {
  final String message;
  SuccessLogout({required this.message});
}

class LogoutFailed extends ProfileState {
  final String message;
  LogoutFailed({required this.message});
}

class GroupDeleted extends ProfileState {
  final String message;

  GroupDeleted({required this.message});
}

class GroupNotDeleted extends ProfileState {
  final String message;

  GroupNotDeleted({required this.message});
}
