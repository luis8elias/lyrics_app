part of 'forgot_pass_bloc.dart';

@immutable
abstract class ForgotPassEvent {}


class ForgotPassword extends ForgotPassEvent{
  final String email;

  ForgotPassword({required this.email});
}
