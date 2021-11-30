import 'package:bloc/bloc.dart';
import 'package:lyrics_app/domain/models/api/list_with_pagination.dart';
import 'package:lyrics_app/domain/models/genre.dart';
import 'package:meta/meta.dart';

part 'genre_list_event.dart';
part 'genre_list_state.dart';

class GenreListBloc extends Bloc<GenreListEvent, GenreListState> {

  final genresRepository;

  GenreListBloc({required this.genresRepository}) : super(GenreListInitial()) {
    on<GenreListEvent>((event, emit) async{

       if (event is LoadingGenres) {
        emit(LoadingData());
        ListWithPagination genres = await genresRepository.getAll();
        List<Genre> genresList;genresList = genres.data as List<Genre> ;
        emit(DataLoaded(genres:genresList));
      }
      
      
    });
  }
}
