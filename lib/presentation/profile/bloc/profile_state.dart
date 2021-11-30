part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class LoadingData extends ProfileState {}

class DataLoaded extends ProfileState {
  final User user;

  DataLoaded({required this.user});
}

