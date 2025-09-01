
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:whatsapp_clone/framework/model/message.dart';
import 'dart:convert';
class StoreDataLocally{

    static Future<bool> isContainsKey(String key)async{
      SharedPreferences sharedPreferences = await  SharedPreferences.getInstance();
      return sharedPreferences.containsKey(key);
    }

    static void saveMessage(Message message,String key)async{
      SharedPreferences sharedPreferences = await  SharedPreferences.getInstance();
      if(await isContainsKey(key)){
        List<Message> getAllMessage = await getMessage(key);
        getAllMessage.add(message);
        List<Map> map = getAllMessage.map((ele)=>{
          'name':ele.name,
          'time':ele.time,
          'isSending':ele.isSending
        }).toList();
        String str = jsonEncode(map);
        sharedPreferences.setString(key,str);
      }else{
        String str = jsonEncode(message.toJson());
        sharedPreferences.setString(key,str);
      }
    }

    static Future<List<Message>> getMessage(String key)async{
      print("Method call");
      SharedPreferences sharedPreferences = await  SharedPreferences.getInstance();
      if(await isContainsKey(key)){
        String getMessage = sharedPreferences.getString(key)!;

        dynamic  getMap = jsonDecode(getMessage);
        print(getMap);
        if(getMap is Map){
          print("1st time");
          return [
            Message(name: getMap['name'], isSending: getMap['isSending'], time: getMap['time'])
          ];
        }
        if(getMap is List<dynamic>){
          print("2nd time");
          return getMap.map((ele)=> Message(name: ele['name'], isSending: ele['isSending'], time: ele['time'])).toList();
        }
      }
      return [];
    }
}