
import 'package:lyrics_app/domain/models/api/simple_list.dart';
import 'package:lyrics_app/domain/models/api/list_with_pagination.dart';
import 'package:lyrics_app/domain/models/api/generic_response.dart';
import 'package:lyrics_app/domain/repositories/lyrics_repository.dart';

class HiveLyricsRepository extends AbstarctLyricsRepository {
 

  @override
  Future<ListWithPagination> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<GenericResponse> delete({required int lyricId}) {
    throw UnimplementedError();
  }
  @override
  Future<int> getCount() {
  
    throw UnimplementedError();
  }

  @override
  Future<GenericResponse> save({required String lyric, required String name, required String genreId, required int groupId}) {
    
    throw UnimplementedError();
  }

  @override
  Future<SimpleList> search({required String lyric}) {
    
    throw UnimplementedError();
  }

  @override
  Future<GenericResponse> update({required String lyric, required String name, required String genreId, required int groupId, required int lyricId}) {
    throw UnimplementedError();
  }
  
}