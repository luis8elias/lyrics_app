part of 'restore_pass_bloc.dart';

@immutable
abstract class RestorePassEvent {}


class SaveNewPassword extends RestorePassEvent{
  final String password;
  final String code;

  SaveNewPassword({required this.password,required this.code});
}