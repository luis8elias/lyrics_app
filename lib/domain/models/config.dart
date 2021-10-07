
import 'package:hive/hive.dart';

part 'hive_adapters/config.g.dart';



@HiveType(typeId: 0)
class Config extends HiveObject{

  @HiveField(0)
  final bool itsTheFirtsTime;

  Config({required this.itsTheFirtsTime});
}