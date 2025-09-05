
import 'package:shopping_app/framework/repository/auth_repository/model/user_info_model.dart';

// these class make for add user information in local
abstract class StoreAuthDataContract{

  // add data
  void addData(User user,String key,String boxName);

  // add data
  void getData(String userId);

}