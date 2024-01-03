import 'dart:convert';
import 'dart:html';

import 'package:flutter/foundation.dart' show kIsWeb;


abstract class Platform {
   dynamic storageFunction <T> ({ required T data, required String key});
   dynamic getUserData<T>({ required String key});
   dynamic removeUserData<T>({ required T data, required String key});
  factory Platform(){
       if(kIsWeb){
         return WebStorage();
       }else{
         return MobileStorage();
       }
  }
}

class MobileStorage implements Platform {
  @override
  storageFunction<T>({required T data,required String key}) {
    
  }
  
  @override
  getUserData<T>({ required String key}) {
    // TODO: implement getUserData
    throw UnimplementedError();
  }
  
  @override
  removeUserData<T>({required T data, required String key}) {
    // TODO: implement removeUserData
    throw UnimplementedError();
  }
}

class WebStorage implements Platform {
  final Storage _localStorage = window.localStorage;
  @override
  storageFunction<T>({required T data,required String key}) {
    try{
      _localStorage[key] = json.encode(data);
      return "The user data saved locally";
    }catch(e){
      throw Exception("WebStorage class error :: Data is not saved because $e");
    }

  }
  
  @override
  getUserData<T>({required String key}) async {
    Future<String?> getData() async => _localStorage[key];
    String data = await getData() ?? "";
    return json.decode(data);
  }
  
  @override
  removeUserData<T>({required T data, required String key}) {
    _localStorage.remove('selected_id');
    return "User data removed successfully";
  }
 

}

