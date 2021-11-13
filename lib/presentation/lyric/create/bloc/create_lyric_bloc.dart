import 'package:bloc/bloc.dart';
import 'package:lyrics_app/domain/models/api/generic_response.dart';
import 'package:lyrics_app/domain/models/api/list_with_pagination.dart';
import 'package:lyrics_app/domain/models/genre.dart';
import 'package:lyrics_app/domain/repositories/genres_respository.dart';
import 'package:lyrics_app/domain/repositories/lyrics_repository.dart';
import 'package:meta/meta.dart';

part 'create_lyric_event.dart';
part 'create_lyric_state.dart';

class CreateLyricBloc extends Bloc<CreateLyricEvent, CreateLyricState> {

  final AbstarctGenresRepository genresRepository;
  final AbstarctLyricsRepository lyricsRepository;


  

  
  CreateLyricBloc({required this.lyricsRepository, required this.genresRepository}) : super(CreateLyricInitial()) {
    on<CreateLyricEvent>((event, emit) async{


      if(event is LoadingCreateLyric){

        emit(LoadingData());
        ListWithPagination genres = await genresRepository.getAll();
        List<Genre> genresList;genresList = genres.data as List<Genre> ;
        emit(DataLoaded(genres:genresList));


      }else if(event is SaveLyric){

        GenericResponse response = await lyricsRepository.save(
          genreId: event.genre,
          lyric: event.lyric,
          name: event.name,
          groupId: event.groupId
        );

        if(response.success){
          emit(LyricCreated(message: response.message));
          ListWithPagination genres = await genresRepository.getAll();
          List<Genre> genresList = genres.data as List<Genre> ;
          emit(DataLoaded(genres: genresList));
        }else{
          emit(LyricNotCreated(message: response.message));
          ListWithPagination genres = await genresRepository.getAll();
          List<Genre> genresList = genres.data as List<Genre> ;
          emit(DataLoaded(genres: genresList));
        }
        

      }
      
    });
  }
  
}
