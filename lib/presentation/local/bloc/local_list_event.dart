part of 'local_list_bloc.dart';

@immutable
abstract class LocalListEvent {}

class LoadingLyrics extends LocalListEvent {
  final int page;

  LoadingLyrics({required this.page});
}

class DeleteLyric extends LocalListEvent {
  final int lyricId;

  DeleteLyric({required this.lyricId});
}

// hecho por ivan
class SearchLyric extends LocalListEvent {
  final String lyric;

  SearchLyric({required this.lyric});
}
