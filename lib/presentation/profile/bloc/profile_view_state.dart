part of 'profile_view_bloc.dart';

@immutable
abstract class ProfileViewState {}

class ProfileViewInitial extends ProfileViewState {}

class LoadingData extends ProfileViewState {}

class DataLoaded extends ProfileViewState {
  final User user;

  DataLoaded({required this.user});
}
