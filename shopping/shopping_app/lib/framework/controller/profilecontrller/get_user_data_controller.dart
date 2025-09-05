

import 'package:riverpod/riverpod.dart';
import 'package:shopping_app/framework/repository/auth_repository/model/user_info_model.dart';
import 'package:shopping_app/framework/utils/local_database_hive.dart';

// these provider help you to give the current user information login
final getUserData = StreamProvider.family<UserInformation,String>((ref,id)async*{

  yield await LocalDatabaseHive.getUserProfileData(id);

});


