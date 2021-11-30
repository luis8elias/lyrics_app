part of 'genre_list_bloc.dart';

@immutable
abstract class GenreListState {}

class GenreListInitial extends GenreListState {}


class LoadingData extends GenreListState{}

class DataLoaded extends GenreListState{
  final List<Genre> genres;

  DataLoaded({required this.genres});
}
