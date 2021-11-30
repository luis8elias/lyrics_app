part of 'local_list_bloc.dart';

@immutable
abstract class LocalListState {}

class LocalListInitial extends LocalListState {}

class LoadingData extends LocalListState {}

class DataLoaded extends LocalListState {
  final List<Lyric> lyrics;
  DataLoaded({required this.lyrics});
}

class LyricDeleted extends LocalListState {
  final String message;

  LyricDeleted({required this.message});
}

class LyricNotDeleted extends LocalListState {
  final String message;
  LyricNotDeleted({required this.message});
}

class LyricsNotfound extends LocalListState {
  final String message;

  LyricsNotfound({required this.message});
}
