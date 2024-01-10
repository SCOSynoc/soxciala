import 'dart:developer';
import 'dart:typed_data';

import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:soxciala/main.dart';
import 'package:http/http.dart' as http;

abstract class LocalDataService {

  Future<void> initLocalService();

  bool addData({ required String key, required String value});

  dynamic getData({required String key});

  bool removeData({required String key});

  /*void addPhotoWithMultipartRequest(Uint8List? fromBytes);*/

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

/*  @override
  void addPhotoWithMultipartRequest(Uint8List? fromBytes)async {
          Uri uri = Uri.parse("http://localhost:8080/media-api/upload");
          Uri uri2 = Uri.parse("http://localhost:8080/media-api/users");
          Map<String, String> headers = {
            "Authorization": "Basic YWxwaGE6cGFzc3dvcmQ=",
            "Content-Type": "application/json"
          };
          var request = http.MultipartRequest('POST', uri);
          request.headers.addAll(headers);

          if(fromBytes != null) {
            request.files.add(http.MultipartFile.fromBytes("image", fromBytes.toList()));
          }

          try {
            http.StreamedResponse response  = await request.send();
              var responseData = await response.stream.bytesToString();
              print("here esponse is $responseData");
          }catch(e){
            log("here response is best time $e");
            throw Exception(e);
          }

          *//*http.Response response =  await http.get(uri2,headers: {
            "Authorization": "Basic YWxwaGE6cGFzc3dvcmQ=",
            "Content-Type": "application/json"
          });

          try {
            if(response.statusCode == 200 ){
              log("here esponse is ${response.body.toString()}");
            }else{
              log("here response is best time ${response.statusCode} ");
              throw Exception("Error while sending");
            }
          }catch(e){
            log("here response is best time $e");
            throw Exception(e);
          }*//*



  }*/


}