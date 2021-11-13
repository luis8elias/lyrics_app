part of 'verification_bloc.dart';

@immutable
abstract class VerificationEvent {}


class VerificateCode extends VerificationEvent{
  final String code;

  VerificateCode({required this.code});
}
