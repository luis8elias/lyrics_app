import 'package:lyrics_app/domain/models/api/generic_response.dart';
import 'package:lyrics_app/domain/models/api/simple_list.dart';

abstract class AbstarctGroupsRepository {
  Future<SimpleList> getAll();

  Future<GenericResponse> save({
    required String name,
  });

  Future<GenericResponse> update({required String name, required int groupId});

  Future<GenericResponse> assignmentGroup({required String code});

  Future<GenericResponse> delete({required int groupId});
}
