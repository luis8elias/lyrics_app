import 'package:bloc/bloc.dart';
import 'package:lyrics_app/domain/models/api/generic_response.dart';
import 'package:lyrics_app/domain/models/api/user.dart';
import 'package:lyrics_app/domain/repositories/auth_repository.dart';
import 'package:lyrics_app/domain/repositories/genres_respository.dart';
import 'package:lyrics_app/domain/repositories/lyrics_repository.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AbstarctAuthRepository authRepository;
  final AbstarctGenresRepository genresRepository;
  final AbstarctLyricsRepository lyricsRepository;

  HomeBloc({

    required this.authRepository,
    required this.genresRepository,
    required this.lyricsRepository

  }) : super(HomeInitial()) {


    on<HomeEvent>((event, emit) async{


      if(event is LoadingHome){

        emit(LoadingData());

        GenericResponse response = await authRepository.getAutherticatedUser();
        int genresCount = await genresRepository.getCount();
        int lyricsCount = await lyricsRepository.getCount();
        if(response.success){
          User user = response.data;
          emit(
           DataLoaded(
            user: user,
            genresCount: genresCount,
            lyricsCount: lyricsCount
           )
          );

        }

        
      }
      
    });
  }
}
