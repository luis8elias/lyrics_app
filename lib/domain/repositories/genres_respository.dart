
import 'package:lyrics_app/domain/models/api/list_with_pagination.dart';

abstract class AbstarctGenresRepository{

  Future<ListWithPagination> getAll();

  Future<int> getCount();
  
}