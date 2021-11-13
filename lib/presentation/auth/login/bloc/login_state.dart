part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class AuthInitial extends LoginState {}

//Login
class TryingToLogin extends LoginState{}


class LoginSuccess extends LoginState{
  final GenericResponse data;
  LoginSuccess({required this.data});
}

class LoginFailed extends LoginState{
  final String message;

  LoginFailed({required this.message});
}


