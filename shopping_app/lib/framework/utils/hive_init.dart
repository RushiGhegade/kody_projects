
import 'package:hive_flutter/hive_flutter.dart';
import '../repository/auth_repository/model/user_information_model.dart';
class HiveInitialize{



  // Hive We Initialize the Hive database
  static void initHive()async{
    // first Initialize the Hive
    await Hive.initFlutter();

    // Registering the adapter
    Hive.registerAdapter(UserInformationAdapter());

    // // Opening the box
      await Hive.openBox<UserInformation>('UserLoginInfo');

  }

  // get box object
  static Box<UserInformation> getBox(){
    return Hive.box<UserInformation>("UserLoginInfo");
  }

}