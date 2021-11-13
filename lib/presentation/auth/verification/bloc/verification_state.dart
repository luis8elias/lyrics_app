part of 'verification_bloc.dart';

@immutable
abstract class VerificationState {}

class VerificationInitial extends VerificationState {}

class VerificationInProcess extends VerificationState{}


class SuccessfulCode extends VerificationState{
  final String message;
  final String code;
  SuccessfulCode({ required this.message, required this.code,});

}

class WrongCode extends VerificationState{
  final String message;
  WrongCode({ required this.message});
  
}