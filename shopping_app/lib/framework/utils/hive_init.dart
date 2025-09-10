
import 'package:hive_flutter/hive_flutter.dart';
import '../controller/auth_controller/database_location_info.dart';
import '../repository/auth_repository/model/user_info_model.dart';

class HiveInitialize{


  // Hive We Initialize the Hive database
  static void initHive()async{
    // first Initialize the Hive
    await Hive.initFlutter();

    // Registering the adapter
    Hive.registerAdapter(UserAdapter());
    Hive.registerAdapter(UserProductInformationAdapter());
    Hive.registerAdapter(UserInformationAdapter());

    Hive.registerAdapter(OrderFilterAdapter());

    // // Opening the box
    //   await Hive.openBox<User>(OPENBOXFORSTORESUERINFO);

  }

  // get box object
  static Future<Box<User>> getBox()async{
    await Hive.openBox<User>(OPENBOXFORSTORESUERINFO);
    return Hive.box<User>(OPENBOXFORSTORESUERINFO);
  }

}