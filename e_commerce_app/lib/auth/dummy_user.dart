

import 'package:e_commerce_app/auth/userauth.dart';

class DummyUser{

  static List<AuthService> users = [
    AuthService(email: "abc@gmail.com", password: "123", isLoggedIn: false, isGuest:false),
    AuthService(email: "xyz@gmail.com", password: "456", isLoggedIn: false, isGuest:false),
    AuthService(email: "test@gmail.com", password: "789", isLoggedIn: false, isGuest:false),
    AuthService(email: "rushi@gmail.com", password: "123", isLoggedIn: false, isGuest:false),
  ];

}