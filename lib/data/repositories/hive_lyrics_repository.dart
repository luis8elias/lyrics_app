
import 'package:hive/hive.dart';
import 'package:lyrics_app/domain/models/api/simple_list.dart';
import 'package:lyrics_app/domain/models/api/list_with_pagination.dart';
import 'package:lyrics_app/domain/models/api/generic_response.dart';
import 'package:lyrics_app/domain/models/lyric.dart';
import 'package:lyrics_app/domain/repositories/lyrics_repository.dart';

class HiveLyricsRepository extends AbstarctLyricsRepository {

  final String boxName = "lyrics";
 

  @override
  Future<ListWithPagination> getAll() async {

    bool existBox = await Hive.boxExists(boxName);

    if(existBox){
      Box<Lyric> box = await Hive.openBox<Lyric>(boxName);
      int elements = box.length;
      if(elements != 0){
        return ListWithPagination(success: true, message: 'Datos Cargados', data:  box.values.toList());
      }else{
        return ListWithPagination(success: true, message: 'Datos Cargados', data: []);
      }
       

    }else{
      return ListWithPagination(success: true, message: 'Datos Cargados', data: []);
    }
    
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