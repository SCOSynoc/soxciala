import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:soxciala/main.dart';

abstract class LocalDataService {

  Future<void> initLocalService();

  bool addData({ required String key, required String value});

  dynamic getData({required String key});

  bool removeData({required String key});

}


class HiveService extends LocalDataService {

  var box = Hive.box(darkModeBox);
  @override
  Future<void> initLocalService() async {
    await Hive.initFlutter();
    await Hive.openBox(darkModeBox);

  }

  @override
  bool removeData({required String key})  {

    box.delete(key);
     return true;
  }

  @override
  bool addData({required String key, required String value}) {
    box.put(key, value);
   return box.containsKey(key);
  }

  @override
  getData({required String key}) {
    dynamic data =  box.get(key);
    return data;
  }


}