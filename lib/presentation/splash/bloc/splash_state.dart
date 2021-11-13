part of 'splash_bloc.dart';

@immutable
abstract class SplashState {}

class SplashInitial extends SplashState {}


class ItsTheFirtsTime extends SplashState{}

class IsAuthenticated extends SplashState{}

class IsNotAuthenticated extends SplashState{}