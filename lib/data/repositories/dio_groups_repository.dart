import 'package:dio/dio.dart';
import 'package:lyrics_app/domain/models/api/group.dart';
import 'package:lyrics_app/domain/models/api/simple_list.dart';
import 'package:lyrics_app/domain/models/api/generic_response.dart';
import 'package:lyrics_app/domain/repositories/groups_repository.dart';

import '../../globals.dart';

class DioGroupsRepository extends AbstarctGroupsRepository {
  Dio dio = new Dio(BaseOptions(
      followRedirects: false,
      validateStatus: (status) {
        return status! < 500;
      },
      headers: {
        "Accept": "application/json",
        "Access-Control-Allow-Origin": "*"
      }));

  @override
  Future<SimpleList> getAll() async {
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
      return SimpleList(data: [], message: e.toString(), success: false);
    }
  }

  @override
  Future<GenericResponse> save({required String name}) async {
    final String url = '${Globals.baseUrl}/api/groups/store';
    dio.options.headers["authorization"] = "bearer ${Globals.token}";
    var formData = FormData.fromMap({'name': name});

    Response response = await dio.post(url, data: formData);
    GenericResponse genericResponse = GenericResponse.fromJson(response.data);

    return genericResponse;
  }

  @override
  Future<GenericResponse> update(
      {required String name, required int groupId}) async {
        print(groupId);
    final String url = '${Globals.baseUrl}/api/groups/update/$groupId';
    dio.options.headers["authorization"] = "bearer ${Globals.token}";
    var formData = FormData.fromMap({
      'name': name,
    });
    Response response = await dio.post(url, data: formData);
    print(response.data);
    GenericResponse genericResponse = GenericResponse.fromJson(response.data);

    return genericResponse;
  }
}
