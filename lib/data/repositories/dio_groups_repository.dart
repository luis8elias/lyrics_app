

import 'package:dio/dio.dart';
import 'package:lyrics_app/domain/models/api/group.dart';
import 'package:lyrics_app/domain/models/api/simple_list.dart';
import 'package:lyrics_app/domain/models/api/generic_response.dart';
import 'package:lyrics_app/domain/repositories/groups_repository.dart';

import '../../globals.dart';

class DioGroupsRepository extends AbstarctGroupsRepository {

  Dio dio = new Dio(
    BaseOptions(
      followRedirects: false,
      validateStatus: (status) {
        return status! < 500;
      },
      headers: {
        "Accept": "application/json",
        "Access-Control-Allow-Origin": "*"
      }
    )
  );


  @override
  Future<SimpleList> getAll() async{
    final String url = '${Globals.baseUrl}/api/groups';
    dio.options.headers["authorization"] = "bearer ${Globals.token}";
    try {
      Response response = await dio.get(url);
      SimpleList list = SimpleList.fromJson(response.data);
      if (list.success) {
        List<Group> groups = list.data.map((e) => Group.fromJson(e)).toList();
        list.data = groups;
      }
      return list;
    } catch (e) {
      return SimpleList(
          data: [], message: e.toString(), success: false);
    }
  }

  @override
  Future<int> getCount() {
    // TODO: implement getCount
    throw UnimplementedError();
  }

  @override
  Future<GenericResponse> save({required String name}) {
    throw UnimplementedError();
  }
}