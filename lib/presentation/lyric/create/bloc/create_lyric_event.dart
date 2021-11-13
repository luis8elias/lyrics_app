part of 'create_lyric_bloc.dart';

@immutable
abstract class CreateLyricEvent {}


class LoadingCreateLyric extends CreateLyricEvent{}


class SaveLyric extends CreateLyricEvent{
  final String name;
  final String lyric;
  final String genre;
  
  final int groupId;

  SaveLyric({
    required this.name,
    required this.lyric,
    required this.genre,
    required this.groupId
  });
}
