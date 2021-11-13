part of 'restore_pass_bloc.dart';

@immutable
abstract class RestorePassState {}

class RestorePassInitial extends RestorePassState {}

class TryingToSaveNewPass extends RestorePassState{}

class PasswordSaved extends RestorePassState{
  final String message;

  PasswordSaved({required this.message});
}

class PasswordNotSaved extends RestorePassState{
  final String message;
  PasswordNotSaved({required this.message});
}


