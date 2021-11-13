part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}


class DoLogin extends LoginEvent{
  final String email;
  final String password;

  DoLogin({required this.email,required this.password});

}




