part of 'edit_lyric_bloc.dart';

@immutable
abstract class EditLyricEvent {}

class LoadingEditLyric extends EditLyricEvent {}

class SaveLyric extends EditLyricEvent {
  final String name;
  final String lyric;
  final String genre;

  final int groupId;

  final int lyricId;

  SaveLyric(
      {required this.name,
      required this.lyric,
      required this.genre,
      required this.groupId,
      required this.lyricId});
}
