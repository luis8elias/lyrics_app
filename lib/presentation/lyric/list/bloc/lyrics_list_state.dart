part of 'lyrics_list_bloc.dart';

@immutable
abstract class LyricsListState {}

class LyricsListInitial extends LyricsListState {}


class LoadingData extends LyricsListState{}

class DataLoaded extends LyricsListState{
  final List<Lyric> lyrics;
  DataLoaded({required this.lyrics});
}

class LyricDeleted extends LyricsListState{
  final String message;

  LyricDeleted({required this.message});
}

class LyricNotDeleted extends LyricsListState{
  final String message;
  LyricNotDeleted({required this.message});
}

class LyricsNotfound extends LyricsListState{
  final String message;
  

  LyricsNotfound({required this.message});
}