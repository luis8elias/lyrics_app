part of 'registration_bloc.dart';

@immutable
abstract class RegistrationState {}

class RegistrationInitial extends RegistrationState {}

class TryingToSaveUser extends RegistrationState{}


class UserSaved extends RegistrationState{
  final String message;
  UserSaved({required this.message});
}

class UserNotSaved extends RegistrationState{
  final String message;
  UserNotSaved({required this.message});
}

