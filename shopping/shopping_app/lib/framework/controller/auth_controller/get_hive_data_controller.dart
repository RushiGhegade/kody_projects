import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_app/framework/controller/auth_controller/auth_controllers.dart';
import 'package:shopping_app/framework/repository/auth_repository/model/user_info_model.dart';
import 'package:shopping_app/framework/utils/local_database_hive.dart';

// these provider is use to get user data from hive
final getHiveDataProvider = StateNotifierProvider<HiveData, List<User>>((ref) {

  final getId = ref.read(getUserCredential);

  return HiveData(getId.value!.id);
});

class HiveData extends StateNotifier<List<User>> {
  String id;

  HiveData(this.id) : super([]);

  void getDataFromHive() async {
    state = await LocalDatabaseHive.getData(id);
  }
}
