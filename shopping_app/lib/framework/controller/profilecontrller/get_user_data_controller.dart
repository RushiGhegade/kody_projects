

import 'package:riverpod/riverpod.dart';
import 'package:shopping_app/framework/repository/auth_repository/model/user_information_model.dart';
import 'package:shopping_app/framework/utils/local_database_hive.dart';

final getUserData = FutureProvider.family<UserInformation,String>((ref,id)async{

  return LocalDatabaseHive.getUserProfileData(id);

});


