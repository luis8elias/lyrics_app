
import 'package:lyrics_app/domain/models/api/generic_response.dart';
import 'package:lyrics_app/domain/models/api/list_with_pagination.dart';
abstract class AbstarctLyricsRepository{

  Future<ListWithPagination> getAll();

  Future<int> getCount();

  Future<GenericResponse> save({
    required String lyric,
    required String name,
    required String genreId,
    required int groupId
  });

  Future<GenericResponse> delete({
    required int lyricId
  });

  

  
  
}