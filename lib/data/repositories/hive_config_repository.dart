import 'package:hive/hive.dart';
import 'package:lyrics_app/domain/models/config.dart';
import 'package:lyrics_app/domain/repositories/config_repository.dart';

import '../../globals.dart';

class HiveConfigRepository extends AbstarctConfigRepository{

  final String boxName = "Config";

  @override
  Future<bool> itsTheFirstTime() async{

    bool existBox = await Hive.boxExists(boxName);

    if(existBox){
      Box<Config> box = await Hive.openBox<Config>(boxName);
      int elements = box.length;
      if(elements !=  0){
        return false;
      }else{
        return true;
      }
    }else{
      return true;
    }
    
    
  }

  @override
  Future<void> setFirstTime() async {
    Box<Config> box = await Hive.openBox<Config>(boxName);
    Config  config = new Config(itsTheFirtsTime: false,token: '', slectedGroup: -1);
    box.add(config);
  }

  @override
  Future<void> setToken({required String token}) async{
    Box<Config> box = await Hive.openBox<Config>(boxName);
    Config? config = box.getAt(0);
    Config newConfig = Config(
      itsTheFirtsTime: config!.itsTheFirtsTime,
      token: token,
      slectedGroup: config.slectedGroup
    );
    box.putAt(0,newConfig);
    Globals.token = token;
    
  }

  @override
  Future<Config?> getConfig() async{
    Box<Config> box = await Hive.openBox<Config>(boxName);
    return box.getAt(0);
  }

  @override
  Future<void> setSelctedGroup({required int groupId}) async{
    Box<Config> box = await Hive.openBox<Config>(boxName);
    Config? config = box.getAt(0);
    Config newConfig = Config(
      itsTheFirtsTime: config!.itsTheFirtsTime,
      token: config.token,
      slectedGroup: groupId
    );
    box.putAt(0,newConfig);
    Globals.groupId = groupId;
  }
     

    
  
  
}