import 'package:dio/dio.dart';
import 'package:lyrics_app/domain/models/api/list_with_pagination.dart';
import 'package:lyrics_app/domain/models/genre.dart';
import 'package:lyrics_app/domain/repositories/genres_respository.dart';
import 'package:lyrics_app/domain/models/api/generic_response.dart';

import '../../globals.dart';

class DioGenresRepository extends AbstarctGenresRepository{

  Dio dio = new Dio(
    BaseOptions(
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
      validateStatus: (_)=>true,
    )
  );

  @override
  Future<int> getCount() async{

    final String url  = '${Globals.baseUrl}/api/genres/count/';
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
  Future<ListWithPagination> getAll() async{
    final String url  = '${Globals.baseUrl}/api/genres/';
    dio.options.headers["authorization"] = "bearer ${Globals.token}";
    Response response = await dio.get(url);
    ListWithPagination list = ListWithPagination.fromJson(response.data);
    if(list.success){
      List<Genre> genres  = list.data.map((e) => Genre.fromJson(e)).toList();
      list.data = genres;
    }
    return list;
  }
  
}