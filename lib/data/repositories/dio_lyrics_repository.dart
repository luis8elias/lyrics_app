
import 'package:dio/dio.dart';
import 'package:lyrics_app/domain/models/api/list_with_pagination.dart';
import 'package:lyrics_app/domain/models/lyric.dart';
import 'package:lyrics_app/domain/models/api/generic_response.dart';
import 'package:lyrics_app/domain/repositories/lyrics_repository.dart';

import '../../globals.dart';

class DioLyricsRepository extends AbstarctLyricsRepository{

  Dio dio = new Dio(
    BaseOptions(
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
      validateStatus: (_)=>true,
    )
  );

 

  @override
  Future<ListWithPagination> getAll() async{
    final String url  = '${Globals.baseUrl}/api/songs/';
    dio.options.headers["authorization"] = "bearer ${Globals.token}";
    Response response = await dio.get(url);
    ListWithPagination list = ListWithPagination.fromJson(response.data);
    if(list.success){
      List<Lyric> lyrics  = list.data.map((e) => Lyric.fromJson(e)).toList();
      list.data = lyrics;
    }
    return list;
  }

  @override
  Future<int> getCount() async{
    final String url  = '${Globals.baseUrl}/api/songs/count/';
    dio.options.headers["authorization"] = "bearer ${Globals.token}";
    Response response = await dio.get(url);
    GenericResponse genericResponse = GenericResponse.fromJson(response.data);

    if(genericResponse.success){
      int count = response.data["data"];
      genericResponse.data = count;
    }
    return genericResponse.data;
    
  }

  @override
  Future<GenericResponse> save({
    required String name,
    required String lyric,
    required String genreId,
    required int groupId}) async{
    final String url  = '${Globals.baseUrl}/api/songs/store';
    dio.options.headers["authorization"] = "bearer ${Globals.token}";
    var formData = FormData.fromMap({
      'name'      : name,
      'lyric'     : lyric,
      'genre_id'  : genreId,
      'group_id'  : groupId
    });

    Response response = await dio.post(url, data: formData);
    GenericResponse genericResponse = GenericResponse.fromJson(response.data);
    if(genericResponse.success){
      Lyric lyricSaved = Lyric.fromJson(response.data["data"]);
      genericResponse.data = lyricSaved;
    }

    return genericResponse;
  }

  @override
  Future<GenericResponse> delete({required int lyricId}) async{
    final String url  = '${Globals.baseUrl}/api/songs/delete/$lyricId';
    dio.options.headers["authorization"] = "bearer ${Globals.token}";
    Response response = await dio.delete(url);

    print(response.toString());
    GenericResponse genericResponse = GenericResponse.fromJson(response.data);
    return genericResponse;
  }
  
}