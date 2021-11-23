import 'package:bloc/bloc.dart';
import 'package:lyrics_app/domain/models/api/generic_response.dart';
import 'package:lyrics_app/domain/models/api/list_with_pagination.dart';
import 'package:lyrics_app/domain/models/genre.dart';
import 'package:lyrics_app/domain/repositories/genres_respository.dart';
import 'package:lyrics_app/domain/repositories/lyrics_repository.dart';
import 'package:meta/meta.dart';

part 'edit_lyric_event.dart';
part 'edit_lyric_state.dart';

class EditLyricBloc extends Bloc<EditLyricEvent, EditLyricState> {
  final AbstarctGenresRepository genresRepository;
  final AbstarctLyricsRepository lyricsRepository;

  EditLyricBloc(
      {required this.genresRepository, required this.lyricsRepository})
      : super(EditLyricInitial()) {
    on<EditLyricEvent>((event, emit) async {
      if (event is LoadingEditLyric) {
        emit(LoadingData());
        ListWithPagination genres = await genresRepository.getAll();
        List<Genre> genresList;
        genresList = genres.data as List<Genre>;
        emit(DataLoaded(genres: genresList));
      } else if (event is SaveLyric) {
        GenericResponse response = await lyricsRepository.update(
            genreId: event.genre,
            lyric: event.lyric,
            name: event.name,
            groupId: event.groupId,
            lyricId: event.lyricId);

        if (response.success) {
          emit(LyricEdited(message: response.message));
          ListWithPagination genres = await genresRepository.getAll();
          List<Genre> genresList = genres.data as List<Genre>;
          emit(DataLoaded(genres: genresList));
        } else {
          emit(LyricNotEdited(message: response.message));
          ListWithPagination genres = await genresRepository.getAll();
          List<Genre> genresList = genres.data as List<Genre>;
          emit(DataLoaded(genres: genresList));
        }
      }
    });
  }
}
