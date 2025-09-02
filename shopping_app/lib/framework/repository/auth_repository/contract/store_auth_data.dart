
import 'package:shopping_app/framework/repository/auth_repository/model/user_information_model.dart';

abstract class StoreAuthDataContract{

  // add data
  void addData(User user,String key,String boxName);

  // add data
  void getData(String userId);

}