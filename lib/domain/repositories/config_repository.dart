import 'package:lyrics_app/domain/models/config.dart';

abstract class AbstarctConfigRepository{

  Future<bool> itsTheFirstTime();

  Future<void> setFirstTime();

  Future<void> setToken({required String token});

  Future<Config?> getConfig();

  Future<void> setSelctedGroup({required int groupId});
  
}