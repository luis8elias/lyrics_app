part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}


class LoadingData extends HomeState{}

class DataLoaded extends HomeState{
  final User user;
  final int genresCount;
  final int lyricsCount;
  

  DataLoaded({required this.lyricsCount,required this.user, required this.genresCount});
}
