
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_app/framework/controller/auth_controller/auth_controllers.dart';

import '../controller/auth_controller/database_location_info.dart';


class LocalDataBaseSharedPref{

  // store status of the userLogin
  static void storeLoginInfo(bool isLogin)async{
    SharedPreferences sharedPreferences = await  SharedPreferences.getInstance();
    sharedPreferences.setBool(USERSTATUSKEY,isLogin);
  }

  // store the LoginUserId
  static void storeCurrentUserLoginId(String id)async{
    SharedPreferences sharedPreferences = await  SharedPreferences.getInstance();
    sharedPreferences.setString(CURRENTLOGINUSERID,id);
  }

  // check user present or not
  static Future<bool> isUserLogin()async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    if (sharedPreferences.containsKey(USERSTATUSKEY)) {
      return sharedPreferences.getBool(USERSTATUSKEY)!;
    } else {
      return false;
    }
  }

  // get Store UserInfo
  static Future<Credential> getCredential()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.containsKey(USERSTATUSKEY)){
      bool isLogin =   sharedPreferences.getBool(USERSTATUSKEY)!;
      String userId =   sharedPreferences.getString(CURRENTLOGINUSERID)!;
      return Credential(isLogin: isLogin, id: userId);
    }
    return Credential(isLogin: false, id: "");
  }

}
