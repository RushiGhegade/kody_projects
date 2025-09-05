import 'package:flutter_riverpod/flutter_riverpod.dart';

// these provider help you to check the login status of the current user
final checkLoginStatus = StateProvider((ref) {
  return false;
});
