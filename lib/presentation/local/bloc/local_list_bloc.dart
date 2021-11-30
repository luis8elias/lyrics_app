import 'package:bloc/bloc.dart';
import 'package:lyrics_app/domain/models/api/list_with_pagination.dart';
import 'package:lyrics_app/domain/models/lyric.dart';
import 'package:lyrics_app/domain/repositories/lyrics_repository.dart';
import 'package:meta/meta.dart';

part 'local_list_event.dart';
part 'local_list_state.dart';


class LocalListBloc extends Bloc<LocalListEvent, LocalListState> {
  final AbstarctLyricsRepository lyricsRepository;


  LocalListBloc({required this.lyricsRepository}) : super(LocalListInitial()) {
    on<LocalListEvent>((event, emit) async{
      
      if (event is LoadingLyrics) {
        emit(LoadingData());
        ListWithPagination lyrics = await lyricsRepository.getAll();
        if(lyrics.data.length != 0){
          List<Lyric> lyricsList = lyrics.data as List<Lyric>;
          emit(DataLoaded(lyrics: lyricsList));
        }else{
          emit(DataLoaded(lyrics: []));
        }
        
      
      } else if (event is SearchLyric) {
        /*
            emit(LoadingData());
            SimpleList lyrics = await lyricsRepository.search(lyric: event.lyric);
            if(lyrics.data.length != 0){
              List<Lyric> lyricsList = lyrics.data as List<Lyric>;
              emit(DataLoaded(lyrics: lyricsList));
            }else{
              emit(LyricsNotfound(message: 'No hay resultados para: ${event.lyric}'));
            }*/
          
      }
      
    });
  }
}
