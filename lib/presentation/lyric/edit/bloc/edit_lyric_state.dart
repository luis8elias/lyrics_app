part of 'edit_lyric_bloc.dart';

@immutable
abstract class EditLyricState {}

class EditLyricInitial extends EditLyricState {}

class LoadingData extends EditLyricState {}

class DataLoaded extends EditLyricState {
  final List<Genre> genres;

  DataLoaded({required this.genres});
}

class LyricEdited extends EditLyricState {
  final String message;
  LyricEdited({required this.message});
}

class LyricNotEdited extends EditLyricState {
  final String message;
  LyricNotEdited({required this.message});
}
