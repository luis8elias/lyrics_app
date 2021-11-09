import 'package:hive/hive.dart';
import 'package:lyrics_app/domain/models/config.dart';
import 'package:lyrics_app/domain/repositories/config_repository.dart';

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
    Config  config = new Config(itsTheFirtsTime: false,token: '');
    box.add(config);
  }
  
}