import 'package:shopping_app/framework/repository/auth_repository/contract/store_auth_data.dart';
import 'package:shopping_app/framework/repository/auth_repository/model/user_info_model.dart';
import 'package:shopping_app/framework/utils/local_database_hive.dart';

// here write method to all methods
class StoreAuthDataRepository extends StoreAuthDataContract {
  @override
  void addData(User user, String key, String boxName) {
    LocalDatabaseHive.addData(user, key);
  }

  @override
  void getData(String userId) async {
    List<User> user = await LocalDatabaseHive.getData(userId);
    print(user);
  }

}
