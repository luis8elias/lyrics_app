part of 'lyrics_list_bloc.dart';

@immutable
abstract class LyricsListEvent {}

class LoadingLyrics extends LyricsListEvent {
  final int page;

  LoadingLyrics({required this.page});
}

class DeleteLyric extends LyricsListEvent {
  final int lyricId;

  DeleteLyric({required this.lyricId});
}

// hecho por ivan
class SearchLyric extends LyricsListEvent {
  final String lyric;

  SearchLyric({required this.lyric});
}
