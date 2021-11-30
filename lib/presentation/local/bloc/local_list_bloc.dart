import 'package:bloc/bloc.dart';
import 'package:lyrics_app/domain/models/api/generic_response.dart';
import 'package:lyrics_app/domain/models/api/list_with_pagination.dart';
import 'package:lyrics_app/domain/models/lyric.dart';
import 'package:meta/meta.dart';

part 'local_list_event.dart';
part 'local_list_state.dart';


class LocalListBloc extends Bloc<LocalListEvent, LocalListState> {
  LocalListBloc() : super(LocalListInitial()) {
    on<LocalListEvent>((event, emit) {
      
 if (event is LoadingLyrics) {
        emit(LoadingData());
        ListWithPagination lyrics = await lyricsRepository.getAll();
        List<Lyric> lyricsList = lyrics.data as List<Lyric>;
        emit(DataLoaded(lyrics: lyricsList));
      } else if (event is DeleteLyric) {
        GenericResponse response =
            await lyricsRepository.delete(lyricId: event.lyricId);
        if (response.success) {
          emit(LyricDeleted(message: response.message));
          ListWithPagination lyrics = await lyricsRepository.getAll();
          List<Lyric> lyricsList = lyrics.data as List<Lyric>;
          emit(DataLoaded(lyrics: lyricsList));
        } else {
          emit(LyricNotDeleted(message: response.message));
          ListWithPagination lyrics = await lyricsRepository.getAll();
          List<Lyric> lyricsList = lyrics.data as List<Lyric>;
          emit(DataLoaded(lyrics: lyricsList));
        }
      } else if (event is SearchLyric) {
        emit(LoadingData());
        ListWithPagination lyrics = await lyricsRepository.search(lyric: event.lyric);

        if(lyrics.data.length != 0){
          List<Lyric> lyricsList = lyrics.data as List<Lyric>;
          emit(DataLoaded(lyrics: lyricsList));
        }else{
          emit(LyricsNotfound(message: 'No hay resultados para: ${event.lyric}'));
        }
       
      }
      
    });
  }
}
