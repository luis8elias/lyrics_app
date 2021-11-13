import 'package:bloc/bloc.dart';
import 'package:lyrics_app/domain/models/api/generic_response.dart';
import 'package:lyrics_app/domain/models/api/list_with_pagination.dart';
import 'package:lyrics_app/domain/models/lyric.dart';
import 'package:lyrics_app/domain/repositories/lyrics_repository.dart';
import 'package:meta/meta.dart';

part 'lyrics_list_event.dart';
part 'lyrics_list_state.dart';

class LyricsListBloc extends Bloc<LyricsListEvent, LyricsListState> {

  final AbstarctLyricsRepository lyricsRepository;



  LyricsListBloc({required this.lyricsRepository}) : super(LyricsListInitial()) {
    on<LyricsListEvent>((event, emit) async{

      if(event is LoadingLyrics){

        emit(LoadingData());
        ListWithPagination lyrics = await lyricsRepository.getAll();
        List<Lyric> lyricsList = lyrics.data as List<Lyric> ;
        emit(DataLoaded(lyrics:lyricsList));

      }else if (event is DeleteLyric){

        GenericResponse response = await lyricsRepository.delete(lyricId: event.lyricId);
        if(response.success){
          emit(LyricDeleted(
            message: response.message
          ));
          ListWithPagination lyrics = await lyricsRepository.getAll();
          List<Lyric> lyricsList = lyrics.data as List<Lyric> ;
          emit(DataLoaded(lyrics:lyricsList));
        }else{
           emit(LyricNotDeleted(
            message: response.message
          ));
          ListWithPagination lyrics = await lyricsRepository.getAll();
          List<Lyric> lyricsList = lyrics.data as List<Lyric> ;
          emit(DataLoaded(lyrics:lyricsList));
        }


      }
      
    });
  }
}
