part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}


class DoLogin extends AuthEvent{
  final String email;
  final String password;

  DoLogin({required this.email,required this.password});

}

class ForgotPassword extends AuthEvent{}

class NewAccount extends AuthEvent{}
