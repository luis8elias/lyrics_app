part of 'create_lyric_bloc.dart';

@immutable
abstract class CreateLyricState {}

class CreateLyricInitial extends CreateLyricState {}

class LoadingData extends CreateLyricState{}

class DataLoaded extends CreateLyricState{
  final List<Genre> genres;

  DataLoaded({required this.genres});
}

class LyricCreated extends CreateLyricState{
  final String message;
  LyricCreated({required this.message});
}

class LyricNotCreated extends CreateLyricState{
  final String message;
  LyricNotCreated({required this.message});
}
