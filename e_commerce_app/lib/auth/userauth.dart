
class AuthService {
  bool? isLoggedIn ;
  bool? isGuest;
  String? email;
  String? password;

  AuthService({required this.email,required this.password,required this.isLoggedIn,required this.isGuest});
}