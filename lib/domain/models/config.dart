
import 'package:hive/hive.dart';

part 'hive_adapters/config.g.dart';

@HiveType(typeId: 0)
class Config extends HiveObject{

  @HiveField(0)
  final bool itsTheFirtsTime;

  @HiveField(1)
  final String token;

  Config({required this.itsTheFirtsTime,required this.token});
}