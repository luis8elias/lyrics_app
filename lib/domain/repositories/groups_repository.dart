import 'package:lyrics_app/domain/models/api/generic_response.dart';
import 'package:lyrics_app/domain/models/api/simple_list.dart';

abstract class AbstarctGroupsRepository {
  Future<SimpleList> getAll();

  Future<GenericResponse> save(
  {
    required String name,
  });
}