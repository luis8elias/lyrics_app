part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}


class TryingToLogin extends AuthState{}


class LoginSuccess extends AuthState{
  final GenericResponse data;

  LoginSuccess({required this.data});
}

class LoginFailed extends AuthState{
  final String message;

  LoginFailed({required this.message});
}
