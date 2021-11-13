part of 'registration_bloc.dart';

@immutable
abstract class RegistrationEvent {}


class SaveNewUser extends RegistrationEvent{
  final String name;
  final String email;
  final String password;

  SaveNewUser({required this.name,required this.email, required this.password});
}