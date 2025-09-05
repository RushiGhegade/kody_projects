
import 'package:riverpod/riverpod.dart';

import '../../utils/local_database_sharedpreferance.dart';

// these provider help you to get current user Credential from shared preferance
final getUserCredential = FutureProvider<Credential>((ref) async {
  return await LocalDataBaseSharedPref.getCredential();
});

// Credential class store user credential
class Credential {
  final bool isLogin;
  final String id;

  Credential({required this.isLogin, required this.id});

  Credential copyWith({bool? isLogin, String? id}) {
    return Credential(isLogin: isLogin ?? this.isLogin, id: id ?? this.id);
  }
}
