
import 'package:shopping_app/framework/controller/auth_controller/database_location_info.dart';
import 'package:shopping_app/framework/repository/auth_repository/model/user_information_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shopping_app/framework/utils/hive_init.dart';


class LocalDatabaseHive{

  // Store the data in hive
  static void addData(User userInfo,String key)async{
    Box<User>  box = await  HiveInitialize.getBox();
    await box.put(key, userInfo);
  }


  // Get All Data
  static Future<List<User>> getData(String userId)async{
    Box<User>  box =await  HiveInitialize.getBox();
    return box.values.toList();
  }

  static Future<String> isUserPresent(String userName,String password)async{

    Box<User>  box =await  HiveInitialize.getBox();

    if(box.containsKey(userName)){
      if(box.get(userName)!.userInformation.password ==password){
        return 'valid';
      }else{
        return 'Invalid Password';
      }
    }else{
      return "Invalid Email";
    }
  }

}