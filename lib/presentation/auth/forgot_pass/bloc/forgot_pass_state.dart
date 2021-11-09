part of 'forgot_pass_bloc.dart';

@immutable
abstract class ForgotPassState {}

class ForgotPassInitial extends ForgotPassState {}


//RestorePass

class TryingToRestorePass extends ForgotPassInitial{}

class MailSended extends ForgotPassInitial{
  final String message;
  MailSended({required this.message});
}

class MailNotSended extends ForgotPassInitial{
  final String message;
  MailNotSended({required this.message});
}
